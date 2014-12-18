#router installer
module.exports = (app)->
  app.use "/api/db", require "./db"
  app.use "/api/search", require "./search"
