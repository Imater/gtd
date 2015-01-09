angular.module "gtdhubApp"
.controller "editorCtrl", ($scope, $stateParams)->
  $scope.editor = $stateParams
  $scope.test = "time = "+Date.now()

