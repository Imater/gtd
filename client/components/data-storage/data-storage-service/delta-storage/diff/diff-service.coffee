angular.module "dStorage"
.service "DiffService", () ->
  class DiffService
    constructor: () ->
      @vcd = new diffable.Vcdiff()
      @vcd.blockSize = 3
    patchMake: (baseText, newText) ->
      delta = @vcd.encode baseText, newText
      JSON.stringify delta
    patchApply: (baseText, diff) ->
      patch = JSON.parse diff
      @vcd.decode baseText, patch
