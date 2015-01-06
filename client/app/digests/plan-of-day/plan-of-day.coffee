angular.module "gtdhubApp"
.config (fmMenuItemsProvider)->
  fmMenuItemsProvider.addMenuItem 1,
    name: "plan-of-day"
    title: "План дня"
    order: 0
    templateUrl: 'app/digests/plan-of-day/plan-of-day.html'
    controller: 'planOfDayCtrl'
