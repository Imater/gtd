BaseWorker = require "../base-worker.coffee"

class SearchWorker extends BaseWorker
  constructor: ()->
    super "search"
    self = @
    @subscribeWorker "queue/worker/search/test",
      (message, cb)->
        self.makeRequest "queue/worker/db/test", {a:1}, (err, answer) ->
          cb null, "proxy = "+answer.res

module.exports = new SearchWorker
