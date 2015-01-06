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
    mouse = new Mouse(@)
    if mouse.isMouseAboutEdge(e)
      mouse.startResize(e)

class Mouse
  constructor: (resizeElement)->
    @resizeElement = resizeElement
  isMouseAboutEdge: (e) ->
    -5 < $(e.target).width() - e.offsetX < 5
  startResize: (e)->
    console.info "Start resize."
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
    console.info "newWidth = ", self.startWidth + delta
    scope.$apply()
  _unregisterAll: (e)->
    $(window).off "mouseup"
    $(window).off "mousemove"
  _finishResize: (e)->
    console.info "finish"
    $("body").removeClass "not-selectable"
    e

cnt = 0
class Frame
  constructor: (options) ->
    _.merge @, @default, options
    @index = cnt
    cnt++;
  default:
    height: 100
    background: undefined
  selectMenuItem: (menuItem)->
    @viewName = menuItem.viewName
  getController: ()->
    @viewName


class Menu
  constructor: (options) ->
    _.merge @, @default, options
    @selectedMenu = 0
    @selectedItem = @menuItems[@selectedMenu][@selected]
    @open = false
  nextMenu: ()->
    if @selectedMenu >= @menuItems.length - 1
      @selectedMenu = 0
    else
      @selectedMenu += 1
  default:
    menuItems: [
      [
        title: "Дерево"
        viewName: "tree"
      ,
        title: "Редактор"
        viewName: "editor"
      ,
        title: "Календарь"
      ,
        title: "Карта ума"
      ,
        title: "Карточки"
      ,
        title: "- - -"
      ]
    ,
      [
        title: "План дня"
      ,
        title: "Поделиться"
      ,
        title: "Поиск"
      ,
        title: "Новости"
      ,
        title: "Контакты"
      ,
        title: "- - -"
      ]
    ]
    selected: 0
  toggleOpen: ()->
    @open = !@open

getFrames = ()->
  c11 = new Col
    frames: [
      new Frame
        height: "100%"
    ]
    width: "100%"

  c21 = new Col
    frames: [
      new Frame
        height: "100%"
        background: "green"
        menu: new Menu
          selected: 0
    ]
    width: "150px"

  c22 = new Col
    frames: [
      new Frame
        height: "100%"
        viewName: 'tree'
        menu: new Menu
          selected: 0
    ]
    width: "200px"

  c23 = new Col
    frames: [
      new Frame
        height: "100%"
        viewName: 'editor'
        menu: new Menu
          selected: 1
    ]
    width: "auto"

  c24 = new Col
    frames: [
      new Frame
        height: "70%"
        background: "green"
    ,
      new Frame
        height: "30%"
        background: "yellow"
    ]
    width: "150px"

  c25 = new Col
    frames: [
      new Frame
        height: "100%"
        background: "darkgreen"
    ]
    width: "50px"
  row1 = new Row [c11], "20%"
  row2 = new Row [c21, c22, c23, c24], "80%"
  row2.addCols c25
  t = new Frames([row1, row2])
  return t

angular.module "gtdhubApp"
  .directive "splitFrames", ($compile, $interval)->
    restrict: "E"
    scope: true
    templateUrl: "components/framemanager/frames-tmpl.html"
    link: ($scope, $element, attrs)->
      $scope.frames = getFrames()

app = angular.module "gtdhubApp"
  .directive "fmFrameWindow", ($controller)->
    restrict: "C"
    scope:
      frame: "="
    templateUrl: "components/framemanager/tmpl/fm-frame-tmpl.html"
    link: ($scope, $element, attrs)->
      $scope.viewList = app.viewList
      $scope.$watch "frame.viewName", (newVal, oldVal)->
        if (newVal or newVal != oldVal) and app.viewList[newVal]
          $controller app.viewList[newVal].controller, {$scope: $scope}

