cnt = 0
angular.module "gtdhubApp"
.service "FmFrame", ()->
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
