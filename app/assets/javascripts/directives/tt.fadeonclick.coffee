App.instance.directive "tt.notificationAnimation", ->

  return {
    restrict:   "EACM"
    transclude: true
    template: "<div ng-transclude></div>"
    scope: {
      animationName: '='
    }

    link: (scope, element, attrs)->
      if scope.animationName is 'autofade'
        element.delay(1000).fadeOut 'slow'
      else
        element.on 'click', ->
          element.fadeOut 'slow'
  }
