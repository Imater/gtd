angular.module "gtdhubApp"
.config (fmMenuItemsProvider)->
  fmMenuItemsProvider.addMenuItem 0,
    name: "tree"
    title: "Дерево"
    order: 0
    templateUrl: 'app/tree/tree.html'
    controller: 'treeCtrl'

