morgan = require("morgan")
express = require "express"
config = require "./index.coffee"
path = require "path"
module.exports = (app) ->
  app.use require("connect-livereload")({port: 35730})
  app.use express.static(path.join(config.root, ".tmp"))
  app.set "views", config.root + "/server/views"
  app.engine "html", require("ejs").renderFile
  app.set "view engine", "html"
  console.info "PATH = ", (path.join(config.root, "client"))
  app.use express.static(path.join(config.root, "client"))
  app.set "appPath", config.root + "/client"
  app.use morgan("dev")
