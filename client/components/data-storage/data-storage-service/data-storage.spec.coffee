describe "dsService", ->

  beforeEach module 'gtdhubApp'
  DataStorage = undefined
  beforeEach inject (_DataStorage_) ->
    DataStorage = _DataStorage_

  dsNotes = undefined
  dsTasks = undefined
  beforeEach ()->
    dsNotes = new DataStorage "notes"
    dsTasks = new DataStorage "tasks"

  it "should exist", ->
    expect( DataStorage ).toBeDefined()

  it "set works", ->
    dsNotes.set "id1",
      title: "first note"
    , (err)->
      dsNotes.get "id1", (err, note)->
        expect(note.title).toBe "first note"

  it "expect found error", ->
    dsNotes.get "idNotFound", (err, note)->
      expect(err).toBe 404


