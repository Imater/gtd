describe "diffService", ->

  beforeEach module 'gtdhubApp'
  CompressService = undefined
  beforeEach inject (_CompressService_) ->
    CompressService = _CompressService_

  it "defined", ->
    expect(CompressService).toBeDefined()

  it "compress and decompress", ->
    compressService = new CompressService()
    text1 = JSON.stringify
      title: "hello"
      text: "i need to save some text"
      list: [1, 2, 3, 4, 5, 6, 7]
    compressed = compressService.compress(text1)
    decompressed = compressService.decompress(compressed)
    expect(decompressed).toBe text1

