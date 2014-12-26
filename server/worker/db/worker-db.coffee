config = require "../../config"
mongoose = require "mongoose"
models = require "./models"
_ = require "lodash"
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
        query = if message.id then {_id: message.id} else undefined
        model(message.model).find query, (err, notes) ->
          cb err, notes
    @subscribeWorker "queue/worker/db/put",
      (message, cb)->
        new model(message.model)(message.data).save (err)->
          cb err, "DB delete ok" + err
    @subscribeWorker "queue/worker/db/post",
      (message, cb)->
        cb null, "DB post ok" + JSON.stringify message
    @subscribeWorker "queue/worker/db/delete",
      (message, cb)->

uppercaseFirstLetter = (modelName)->
  modelName = _.map modelName, (e, i)->
    if i == 0
      e.toUpperCase()
    else
      e
  modelName.join("")

model = (modelName)->
  models[uppercaseFirstLetter(modelName)]

module.exports = new DbWorker
