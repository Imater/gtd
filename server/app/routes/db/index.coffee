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
    @router.get "/:model/:id?", (req, res, a)->
      self.makeRequest "queue/worker/db/get", req.params, (err, answer)->
        res.status 200
          .send answer
    @router.put "/:model/:id?", (req, res, a)->
      self.makeRequest "queue/worker/db/put", req.params, (err, answer)->
        res.status 200
          .send answer
    @router.post "/:model/:id?", (req, res, a)->
      self.makeRequest "queue/worker/db/post", req.params, (err, answer)->
        res.status 200
          .send answer
    @router.delete "/:model/:id?", (req, res, a)->
      self.makeRequest "queue/worker/db/delete", req.params, (err, answer)->
        res.status 200
          .send answer
module.exports = (new DbRouter).router
