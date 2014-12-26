_ = require "lodash"
Rpc = require "../components/rpc"
amqpConnection = require "../components/amqp-connection.coffee"

class BaseWorker
  constructor: (name)->
    @rpc = new Rpc(amqpConnection)
    @subscribeWorker "queue/worker/#{name}/ping",
      (message, cb)->
        cb null, "pong"
  subscribeWorker: (listenPath, replyFn)->
    console.info "Subscribe #{listenPath}"
    amqpConnection.queue listenPath, (q)->
      q.subscribe (message, headers, deliveryInfo, m)->
        tm = Date.now() - message.startTime
        replyFn message, (err, result)->
          amqpConnection.publish m.replyTo,
            status: if err then 400 else 200
            res: result
            tm: tm + "ms"
          ,
            contentType: m.contentType
            contentEncoding: "utf-8"
            correlationId: m.correlationId
  makeRequest: (channelPath, queueReq = {}, cb)->
    queueReqMerged = _.merge {}, queueReq,
      startTime: Date.now()
    @rpc.makeRequest channelPath, queueReqMerged, cb

module.exports = BaseWorker
