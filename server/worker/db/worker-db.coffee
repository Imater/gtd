module.exports = [
  listenPath: "queue/worker/db"
  replyFn: (message, cb) ->
    cb null, "answer"
,
  listenPath: "queue/worker/db/test"
  replyFn: (message, cb) ->
    cb null, "from db with love"
]
