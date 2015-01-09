angular.module "dStorage"
.service "StorageEngine", (CompressService) ->
  class StorageEngine
    constructor: (storageName) ->
      @storageName = storageName
      @storage = {}
      @compressService = new CompressService
    get: (id, cb) ->
      if !@storage[id]
        cb 404
      else
        element = @compressService.decompress @storage[id]
        cb null, element
    set: (id, element, cb) ->
      @storage[id] = @compressService.compress element
      cb null
    unset: (id, cb) ->
      if @storage[id]
        delete @storage[id]
        cb null
      else
        cb null
