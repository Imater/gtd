angular.module "dStorage"
.service "BrowserStorage", (StorageEngine) ->
  class BrowserStorage
    constructor: (storageName) ->
      @storageName = storageName
      @storageEngine = new StorageEngine storageName
    get: (id, cb) ->
      self = @
      @storageEngine.get id, (err, elementString) ->
        if err
          cb 404
        else
          element = self.parse elementString
          cb err, element
    set: (id, element, cb) ->
      elementString = @stringify element
      @storageEngine.set id, elementString, (err) ->
        cb err
    unset: (id, cb) ->
      @storageEngine.unset id, (err) ->
        cb err
    stringify: (element) ->
      JSON.stringify element
    parse: (stringElement) ->
      JSON.parse stringElement

