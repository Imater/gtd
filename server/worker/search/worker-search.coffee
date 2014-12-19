module.exports = [
  listenPath: "queue/worker/search"
  replyFn: (message, cb) ->
    cb null, "answer from search"
,
  listenPath: "queue/worker/search/test"
  replyFn: (message, cb) ->
    cb null, "from search with love"
]
