angular.module "gtdhubApp"
.directive "fmFrames", ($compile, $interval, fmDefaultFrames)->
  restrict: "E"
  scope: true
  templateUrl: "components/frame-manager/fm-frames-tmpl.html"
  link: ($scope, $element, attrs)->
    $scope.frames = fmDefaultFrames
