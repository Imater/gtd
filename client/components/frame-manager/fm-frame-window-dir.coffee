app = angular.module "gtdhubApp"
.directive "fmFrameWindow", ($controller)->
  restrict: "C"
  scope:
    frame: "="
  templateUrl: "components/framemanager/tmpl/fm-frame-tmpl.html"
  link: ($scope, $element, attrs)->
    $scope.viewList = app.viewList
    $scope.$watch "frame.menu.selectedItem", (newVal, oldVal)->
      if (newVal or newVal?.name != oldVal?.name) and newVal.controller
        $controller newVal.controller, {$scope: $scope}
