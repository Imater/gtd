angular.module "dStorage"
.service "MemoryStorage", () ->
  class MemoryStorage
    constructor: (storageName) ->
      @storageName = storageName
      @storage = {}
    get: (id, cb) ->
      if !@storage[id]
        cb 404
      else
        cb null, @storage[id]
    set: (id, element, cb) ->
      @storage[id] = element
      cb null
