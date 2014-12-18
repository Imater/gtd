#baseRoute
express = require "express"

class BaseRoute
  constructor: ->
    @router = express.Router()
    @router.get "/ping", (req, res)->
      res.status 200
        .send "#{req.baseUrl} pong"

module.exports = BaseRoute
