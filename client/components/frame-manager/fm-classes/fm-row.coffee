angular.module "gtdhubApp"
.service "FmRow", ()->
  class Row
    constructor: (cols = [], height = 100)->
      @height = height
      @cols = []
      @addCols cols
    addCols: (cols)->
      @cols = @cols.concat cols
