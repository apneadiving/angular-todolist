App.instance.directive "tt.notification", ->

  return {
    restrict:   "EACM"
    template: JST['templates/directives/notifications']()

    controller: ['$scope', 'notificationsSvc', ($scope, notificationsSvc)->

      $scope.notifications = notificationsSvc.get()

    ]
  }
