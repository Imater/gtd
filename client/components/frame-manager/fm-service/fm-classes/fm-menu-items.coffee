angular.module "gtdhubApp"
.provider "fmMenuItems", ()->
  @menuItems = []
  @addMenuItem = (menuIndex, menuItem)->
    @menuItems[menuIndex] = [] if !@menuItems[menuIndex]
    @menuItems[menuIndex].push menuItem
    @menuItems[menuIndex] = _.sortBy @menuItems[menuIndex], (item)->
      item.order
  @$get = ()->
    @menuItems
  return
