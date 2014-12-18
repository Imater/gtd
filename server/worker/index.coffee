#workers installer
amqp = require "amqp"
config = require "../config"
amqp.conn = amqp.createConnection
  host: config.amqp.host
  port: config.amqp.port
  login: config.amqp.login
  password: config.amqp.password
  connectionTimeout: config.amqp.connectionTimeout
  authMechanism: "AMQPLAIN"
  vhost: config.amqp.vhost
  noDelay: true
  ssl:
    enabled: false

amqp.conn.on "ready", ->
  console.info "connection ok"
