#config for development
path = require "path"

module.exports =
  root: path.normalize(__dirname+"/../..")
  amqp:
    host: "localhost"
    port: 5672
    login: "app"
    password: "gtdhubapp"
    connectionTimeout: 15000
    vhost: "/gtdhub/db"
  mongoose:
    connectionString: "mongodb://localhost/gtd-dev"
