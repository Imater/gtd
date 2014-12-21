#workers installer
fs = require "fs"
config = require "../config"
amqpConnection = require "../components/amqp-connection.coffee"

Rpc = require "../components/rpc"
rpc = new Rpc(amqpConnection)

amqpConnection.on "ready", ->
  installWorkers()

amqpConnection.on "error", (err) ->
  console.info "Error", err
installWorkers = ()->
  fs.readdirSync(".")
    .forEach (file)->
      fs.stat "./#{file}", (err, fileInfo)->
        if fileInfo.isDirectory()
          installWorkerFromDir(file)

installWorkerFromDir = (dir)->
  worker = require "./#{dir}/worker-#{dir}.coffee"
