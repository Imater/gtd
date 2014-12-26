amqp = require "amqp"
config = require "../config"

module.exports = amqp.createConnection
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
