describe "storageEngine", ->

  beforeEach module 'gtdhubApp'
  StorageEngine = undefined
  storageEngine = undefined
  beforeEach inject (_StorageEngine_) ->
    StorageEngine = _StorageEngine_

  beforeEach ()->
    storageEngine = new StorageEngine "notes"

  it "exists", ->
    expect(storageEngine).toBeDefined()

  it "set and get", ->
    sample = "hello i need to compress this text"
    storageEngine.set "id1", sample, (err) ->
      storageEngine.get "id1", (err, element) ->
        expect(element).toBe sample
