angular.module "dStorage"
.service "DataStorage", (MemoryStorage, BrowserStorage)->
  class DataStorage
    constructor: (storageName) ->
      @storageName = storageName
      @memoryStorage = new MemoryStorage storageName
      @browserStorage = new BrowserStorage storageName
    get: (id, cb) ->
      self = @
      @memoryStorage.get id, (err, element) ->
        if err
          self.browserStorage.get id, (err, element) ->
            if err
              cb err
            else
              self.memoryStorage.set id, element, (err) ->
                cb err, element
        else
          cb err, element
    set: (id, element, cb) ->
      @memoryStorage.set id, element, (err)->
        cb err
