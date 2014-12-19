#baseRoute
express = require "express"
amqp = require "amqp"
_ = require "lodash"
Rpc = require "../../components/rpc"

class BaseRoute
  constructor: (name)->
    self = @
    @name = name
    @router = express.Router()
    @router.get "/ping", (req, res)->
      channelPath = "queue/worker/#{self.name}"
      queueReq =
        pingTime = Date.now()
      self.makeRequest channelPath, queueReq, (err, answer) ->
        res.status 200
          .send "Pong from #{self.name} #{JSON.stringify answer}"
    @rpc = new Rpc(amqp.connection)
  makeRequest: (channelPath, queueReq = {}, cb)->
    queueReq = _.merge {}, queueReq,
      startTime: Date.now()
    @rpc.makeRequest channelPath, queueReq, cb

module.exports = BaseRoute
