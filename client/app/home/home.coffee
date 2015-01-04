angular.module('gtdhubApp').config ($stateProvider) ->
  $stateProvider.state 'home',
    url: '/home'
    templateUrl: 'app/home/home.html'
    controller: 'homeCtrl'

angular.module('gtdhubApp').config ($stateProvider) ->
  $stateProvider.state 'home.tree',
    url: '/tree/{p2}/{p3}'
    views:
      "v2":
        templateUrl: ($stateParams)->
          "app/#{$stateParams.p2}/#{$stateParams.p2}.html"
        controller:  ($stateParams)->
          "#{$stateParams.p2}Ctrl"
      "v3":
        templateUrl: ($stateParams)->
          "app/#{$stateParams.p3}/#{$stateParams.p3}.html"
        controller:  ($stateParams)->
          "#{$stateParams.p3}Ctrl"

