angular.module "gtdhubApp"
.service "fmMouse", ()->
  class Mouse
    constructor: (resizeElement)->
      @resizeElement = resizeElement
    isMouseAboutEdge: (e) ->
      Math.abs($(e.target).width() - e.offsetX) < 5
    startResize: (e)->
      @startX = e.clientX
      @startY = e.clientY
      @startWidth = parseInt @resizeElement.width.replace(["px","%"], ["",""])
      @_registerMouseUp(e)
      @_registerMouseMove(e)
      $("body").addClass "not-selectable"
      return
    _registerMouseUp: (e)->
      self = @
      $(window).on "mouseup", (e)->
        self._finishResize(e)
        self._unregisterAll(e)
      return
    _registerMouseMove: (e)->
      self = @
      scope = angular.element(e.target).scope()
      $(window).on "mousemove", (event)->
        self._setNewWidth event, scope
    _setNewWidth: (e, scope)->
      self = @
      delta = (e.clientX - self.startX)
      self.resizeElement.width = self.startWidth + delta + "px"
      scope.$apply()
    _unregisterAll: (e)->
      $(window).off "mouseup"
      $(window).off "mousemove"
    _finishResize: (e)->
      $("body").removeClass "not-selectable"
      e
