angular.module "gtdhubApp"
.service "FmMenu", (fmMenuItems)->
  class Menu
    constructor: (options) ->
      _.merge @, @default, options
      @selectedMenu = 0 if !@selectedMenu
      @selectedItem = fmMenuItems[@selectedMenu][@selected]
      @open = false
      @menuItems = fmMenuItems
    nextMenu: ()->
      if @selectedMenu >= fmMenuItems.length - 1
        @selectedMenu = 0
      else
        @selectedMenu += 1
    default:
      selected: 0
    toggleOpen: ()->
      @open = !@open
    selectMenuItem: (menuItem)->
      @selectedItem = menuItem
