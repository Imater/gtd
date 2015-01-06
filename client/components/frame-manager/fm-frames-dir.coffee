angular.module "gtdhubApp"
.directive "fmFrames", ($compile, $interval, fmDefaultFrames)->
  restrict: "E"
  scope: true
  templateUrl: "components/framemanager/frames-tmpl.html"
  link: ($scope, $element, attrs)->
    $scope.frames = fmDefaultFrames
