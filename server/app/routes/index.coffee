#router installer
fs = require "fs"
_dir = "./routes"

autoInstallRoutes = (app)->
  fs.readdirSync(_dir)
    .forEach (file)->
      fs.stat _dir + "/" + file, (err, fileinfo)->
        if fileinfo.isDirectory()
          addRoute(app, file)

addRoute = (app, filename) ->
  app.use "/api/#{filename}", require "./#{filename}"

module.exports = autoInstallRoutes
