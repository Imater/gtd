#db route
BaseRoute = require "../base-route"
class DbRouter extends BaseRoute
  constructor: ()->
    super "db"
    self = @
    @router.get "/test", (req, res)->
      self.makeRequest "queue/worker/db/test", {}, (err, answer)->
        res.status 200
          .send answer

module.exports = (new DbRouter).router
