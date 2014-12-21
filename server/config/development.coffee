#config for development

module.exports =
  amqp:
    host: "localhost"
    port: 5672
    login: "app"
    password: "gtdhubapp"
    connectionTimeout: 15000
    vhost: "/gtdhub/db"
  mongoose:
    connectionString: "mongodb://localhost/gtd-dev"
