#search route
BaseRoute = require "../base-route"
class SearchRouter extends BaseRoute
  constructor: ()->
    super
    @router.get "/test", (req, res)->
      res.status 200
        .send "test search ok"

module.exports = (new SearchRouter).router
