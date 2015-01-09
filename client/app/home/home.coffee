angular.module('gtdhubApp').config ($stateProvider) ->
  $stateProvider.state 'home',
    url: '/home'
    views:
      "main":
        templateUrl: 'app/home/home.html'
        controller: 'homeCtrl'

angular.module('gtdhubApp').config ($stateProvider) ->
  $stateProvider.state 'home.note',
    url: '?note'
