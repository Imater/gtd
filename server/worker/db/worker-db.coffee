config = require "../../config"
mongoose = require "mongoose"
models = require "./models"
BaseWorker = require "../base-worker.coffee"

mongoose.connect config.mongoose.connectionString

class DbWorker extends BaseWorker
  constructor: ()->
    super "db"
    @subscribeWorker "queue/worker/db/test",
      (message, cb)->
        cb null, "DB test ok"
    @subscribeWorker "queue/worker/db/get",
      (message, cb)->
        cb null, "DB get ok" + JSON.stringify message
    @subscribeWorker "queue/worker/db/put",
      (message, cb)->
        cb null, "DB put ok"  + JSON.stringify message
    @subscribeWorker "queue/worker/db/post",
      (message, cb)->
        cb null, "DB post ok" + JSON.stringify message
    @subscribeWorker "queue/worker/db/delete",
      (message, cb)->
        new models.Note({name:"new note"}).save (err)->
          cb null, "DB delete ok" + err
module.exports = new DbWorker
