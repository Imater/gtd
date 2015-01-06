angular.module('gtdhubApp').config ($stateProvider) ->
  $stateProvider.state 'home',
    url: '/home'
    templateUrl: 'app/home/home.html'
    controller: 'homeCtrl'

app = angular.module('gtdhubApp').config ($stateProvider) ->
  views = ["v1", "v2", "v3", "v4"]
  viewConfig = {}
  setView = (v)->
    result =
      templateUrl: ($stateParams)->
        console.info "loadView = ", $stateParams
        viewName = $stateParams[v]
        app.viewList[viewName].templateUrl if app.viewList[viewName]
      controllerProvider: ($stateParams)->
        viewName = $stateParams[v]
        console.info "controller", viewName, app.viewList[viewName].controller
        app.viewList[viewName].controller if app.viewList[viewName]
    return result
  for v in views
    viewConfig[v] = setView(v)

  $stateProvider.state 'home.tree',
    url: '//{note}'
    views: viewConfig
    onEnter: ()->
      console.info "enter"

