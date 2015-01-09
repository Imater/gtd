angular.module "gtdhubApp"
.service "FmCol", (fmMouse)->
  class Col
    constructor: (options) ->
      @frames = []
      @addFrames options.frames if options.frames
      _.merge @, @default, options
    default:
      height: 100
      width: 100
    addFrames: (frames) ->
      @frames = @frames.concat frames
    mousedown: (e)->
      mouse = new fmMouse(@)
      if mouse.isMouseAboutEdge(e)
        mouse.startResize(e)
  return Col
