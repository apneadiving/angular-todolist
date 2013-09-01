App.instance.directive "tt.notification", ->

  onClose = null

  return {
    restrict:   "EACM"
    template: JST['templates/directives/notifications']()

    controller: ['$scope', 'notificationsSvc', ($scope, notificationsSvc)->

      $scope.notifications = notificationsSvc.get()

    ]

    link: (scope, element)->
      element.on 'click', ->
        element.fadeOut 'slow', ->
          onClose()
          scope.onclose()
  }
