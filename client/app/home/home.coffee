 angular.module('gtdhubApp').config ($stateProvider) ->
  $stateProvider.state 'home',
    url: '/home'
    templateUrl: 'app/home/home.html'
    controller: 'homeCtrl'
