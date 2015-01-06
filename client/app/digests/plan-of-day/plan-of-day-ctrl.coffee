angular.module "gtdhubApp"
.controller "planOfDayCtrl", ($scope, $stateParams)->
  $scope.plans = [
    "clean teath"
    "clean eyes"
    "clean legs"
    "clean hands"
  ]
  console.info "hello"
