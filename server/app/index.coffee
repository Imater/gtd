#app index
express = require "express"
app = express()
amqp = require "amqp"
config = require "../config"
server = require "http"
  .createServer app
require("./routes") app

amqp.connection = require "../components/amqp-connection.coffee"

amqp.connection.on "ready", ->
  server.listen 5000, "127.0.0.1", ->
    console.info "start listen on 5000 port"
