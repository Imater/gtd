#db route
BaseRoute = require "../base-route"
class DbRouter extends BaseRoute
  constructor: ()->
    super
    @router.get "/test", (req, res)->
      res.status 200
        .send "test ok"

module.exports = (new DbRouter).router
