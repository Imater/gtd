angular.module "dStorage"
.service "DeltaStorage", (BrowserStorage, DiffService) ->
  class DeltaStorage
    constructor: (storageName) ->
      @storageName = storageName
      @storageBase = new BrowserStorage storageName
      @storageDiff = new BrowserStorage "#{storageName}_diff"
    get: (id, cb) ->
      self = @
      @storageBase.get id, (errBase, baseElement) ->
        self.storageDiff.get id, (errDiff, diff) ->
          if errDiff and errDiff
            cb 404
          else
            elementString = new DiffService().patchApply baseElement, diff
            element = self.storageBase.parse elementString
            cb null, element
    set: (id, element, cb) ->
      self = @
      console.info id, element
      @storageBase.get id, (err, baseElement) ->
        baseElement = "" if err == 404
        elementString = self.storageBase.stringify element
        diff = new DiffService().patchMake baseElement, elementString
        self.storageDiff.set id, diff, (err) ->
          cb err
    flush: (id, cb) ->
      self = @
      @get id, (err, element) ->
        console.info "element", element
        elementString = self.storageBase.stringify element
        self.storageBase.set id, elementString, (err) ->
          self.storageDiff.unset id, (err) ->
            cb err
