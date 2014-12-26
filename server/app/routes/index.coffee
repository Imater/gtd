#router installer
fs = require "fs"
_dir = "#{__dirname}"
async = require "async"
errors = {}
errors[404] = (req, res) ->
  viewFilePath = "404"
  statusCode = 404
  result = status: statusCode
  res.status result.status
  res.render viewFilePath, (err) ->
    return res.json(result, result.status)  if err
    res.render viewFilePath

autoInstallRoutes = (app)->
  fs.readdirSync(_dir)
    .forEach (file)->
      fs.stat _dir + "/" + file, (err, fileinfo)->
        if fileinfo.isDirectory()
          addRoute(app, file)
  setTimeout ->
    app.route("/:url(api|auth|components|app|bower_components|assets)/*").get errors[404]
    app.route("/*").get (reg, res) ->
      res.sendfile app.get("appPath") + "/index.html"
  , 1000

addRoute = (app, filename) ->
  app.use "/api/#{filename}", require "./#{filename}"

module.exports = autoInstallRoutes
