#search route
BaseRoute = require "../base-route"
class SearchRouter extends BaseRoute
  constructor: ()->
    super "search"
    self = @
    @router.get "/test", (req, res)->
      self.makeRequest "queue/worker/search/test", {}, (err, answer)->
        res.status 200
          .send answer

module.exports = (new SearchRouter).router
