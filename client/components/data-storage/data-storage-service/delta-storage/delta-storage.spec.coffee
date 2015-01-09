describe "deltaStorage", ->

  beforeEach module 'gtdhubApp'
  DeltaStorage = undefined
  deltaStorage = undefined
  beforeEach inject (_DeltaStorage_) ->
    DeltaStorage = _DeltaStorage_

  beforeEach ()->
    deltaStorage = new DeltaStorage "notes"

  it "exists", ->
    expect(DeltaStorage).toBeDefined()

  it "not found", ->
    deltaStorage.get "notExist", (err) ->
      expect(err).toBe 404

  it "set", ->
    element =
      title: "hello"
    deltaStorage.set "id1", element, (err) ->
      expect(err).toBeNull()
      element.title = "hello changed"
      deltaStorage.set "id1", element, (err) ->
        element.title = "hello changed again"
        deltaStorage.set "id1", element, (err) ->
          deltaStorage.flush "id1", (err) ->
          expect(err).toBeNull()
          console.info JSON.stringify deltaStorage, null, "  "
          deltaStorage.get "id1", (err, note) ->
            #expect(note).toBe element
            console.info "note = ", note
