angular.module "gtdhubApp"
.config (fmMenuItemsProvider)->
  fmMenuItemsProvider.addMenuItem 0,
    name: "tree"
    title: "Дерево"
    order: 0
    templateUrl: 'app/view/main/tree/tree.html'
    controller: 'treeCtrl'

