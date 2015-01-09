describe "DiffService", ->

  beforeEach module 'gtdhubApp'
  DiffService = undefined
  beforeEach inject (_DiffService_) ->
    DiffService = _DiffService_

  it "defined", ->
    expect(DiffService).toBeDefined()

  it "make and apply patch", ->
    diffService = new DiffService
    text1 = "text before changes need to be the same"
    text2 = "text after changes may be the same"
    patch = diffService.patchMake text1, text2
    expect(patch).toBeDefined()
    restored = diffService.patchApply text1, patch
    expect(restored).toBe text2

