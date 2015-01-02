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
  constructor: (frame) ->
    @frame = []
    @addFrames frame
  addFrames: (frame) ->
    @frame = frame

class Frame
  constructor: (options) ->
    _.merge @, @default, options
  default:
    width: 100
    height: 100

angular.module "gtdhubApp"
  .directive "splitFrames", ($compile, $interval)->
    restrict: "E"
    scope: true
    templateUrl: "components/framemanager/frames-tmpl.html"
    link: ($scope, $element, attrs)->
      f1 = new Frame
        width: 60
        height: 25
        background: "blue"
      f2 = new Frame
        width: 40
        height: 30
        background: "red"
      c1 = new Col f1
      c2 = new Col f2
      row1 = new Row [c1], 80
      row2 = new Row [c2], 20
      t = new Frames([row1, row2])
      $scope.frames = t

