#workers installer
fs = require "fs"
config = require "../config"
amqpConnection = require "../components/amqp-connection.coffee"

Rpc = require "../components/rpc"
rpc = new Rpc(amqpConnection)

amqpConnection.on "ready", ->
  installWorkers()

installWorkers = ()->
  fs.readdirSync(".")
    .forEach (file)->
      fs.stat "./#{file}", (err, fileInfo)->
        if fileInfo.isDirectory()
          installWorkerFromDir(file)

installWorkerFromDir = (dir)->
  workerPaths = require "./#{dir}/worker-#{dir}.coffee"
  for worker in workerPaths
    console.info worker
    installWorker(amqpConnection, worker.listenPath, worker.replyFn)

installWorker = (connection, listenPath, replyFn)->
  connection.queue listenPath, (q)->
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
