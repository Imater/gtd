angular.module "gtdhubApp"
.service "FmFrames", ()->
  class Frames
    constructor: (rows = [])->
      @rows = []
      @addRows rows
    addRows: (rows)->
      @rows = @rows.concat rows

