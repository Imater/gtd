angular.module "gtdhubApp"
.controller "planOfDayCtrl", ($scope, $stateParams, dataStorage)->
  console.info new dataStorage
  $scope.plans = [
    "clean teath"
    "clean eyes"
    "clean legs"
    "clean hands"
  ]
