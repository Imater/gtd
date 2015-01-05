angular.module "gtdhubApp"
  .controller "treeCtrl", ($scope)->
    $scope.tree = "tree!" + Date.now()
    console.info "tree controller started"
