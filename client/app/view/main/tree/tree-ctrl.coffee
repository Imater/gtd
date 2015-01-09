angular.module "gtdhubApp"
  .controller "treeCtrl", ($scope)->
    $scope.tree = "tree!" + Date.now()
