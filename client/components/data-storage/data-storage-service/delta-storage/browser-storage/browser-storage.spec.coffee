describe "browserStorage", ->

  beforeEach module 'gtdhubApp'
  BrowserStorage = undefined
  browserStorage = undefined
  beforeEach inject (_BrowserStorage_) ->
    BrowserStorage = _BrowserStorage_

  beforeEach ()->
    browserStorage = new BrowserStorage "notes"

  it "exists", ->
    expect(browserStorage).toBeDefined()

  it "can set and get object", ->
    sample =
      title: "Hello"
      text: "text"
      list: [1, 2, 3, 4]
    browserStorage.set "id1", sample, (err) ->
      expect(err).toBe null
      sample.text = "text is now changed"
      browserStorage.set "id1", sample, (err) ->
        expect(err).toBe null
        browserStorage.get "id1", (err, element) ->
          expect(_.isEqual(element, sample)).toBe true
