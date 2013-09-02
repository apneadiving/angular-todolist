App.instance.directive "tt.notificationAnimation", [ 'notificationsSvc', (notificationsSvc)->

  return {
    restrict:   "EACM"
    transclude: true
    template: "<div ng-transclude></div>"
    scope: {
      notification: '='
    }

    link: (scope, element, attrs)->

      remove = (notification)->
        notificationsSvc.mark_as_read(notification)
        element.parent().remove()

      if scope.notification.animation is 'autofade'
        element.delay(1000).fadeOut 'slow', ->
          remove(scope.notification)
      else
        element.on 'click', ->
          element.fadeOut 'slow', ->
            remove(scope.notification)


  }
]
