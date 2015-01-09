angular.module "gtdhubApp"
.config (fmMenuItemsProvider)->
  fmMenuItemsProvider.addMenuItem 0,
    name: "editor"
    title: "Редактор"
    order: 1
    templateUrl: 'app/view/main/editor/editor.html'
    controller: 'editorCtrl'

