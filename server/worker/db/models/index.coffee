mongoose = require "mongoose"
fs = require "fs"
excludeFileNames = ["index.coffee"]
models = {}

fs.readdirSync(__dirname)
  .filter (fileName) ->
    fileName not in excludeFileNames
  .forEach (fileName) ->
    model = require "#{__dirname}/#{fileName}"
    models[model.modelName] = model

module.exports = models
