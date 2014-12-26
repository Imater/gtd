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
  fs.readdirSync(__dirname)
    .forEach (file)->
      fs.stat "#{__dirname}/#{file}", (err, fileInfo)->
        if fileInfo.isDirectory()
          installWorkerFromDir(file)

installWorkerFromDir = (dir)->
  worker = require "#{__dirname}/#{dir}/worker-#{dir}.coffee"
