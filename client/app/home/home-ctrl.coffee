class Frames
  constructor: (rows = [])->
    @rows = []
    @addRows rows
  addRows: (rows)->
    @rows = @rows.concat rows

class Row
  constructor: (cols = [], height = 100)->
    @height = height
    @cols = []
    @addCols cols
  addCols: (cols)->
    @cols = @cols.concat cols

class Col
  constructor: (frames) ->
    @frames = []
    @addFrames frames
  addFrames: (frames) ->
    @frames = @frames.concat frames

class Frame
  constructor: (width = 100) ->
    @width = width


angular.module("gtdhubApp").controller "homeCtrl", ($scope)->
  f1 = new Frame 70
  f2 = new Frame 30
  c1 = new Col f1
  c2 = new Col f2
  row1 = new Row [c1], 80
  row2 = new Row [c2], 20
  t = new Frames([row1, row2])
  $scope.frames = t
