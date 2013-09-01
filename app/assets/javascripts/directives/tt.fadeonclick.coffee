App.instance.directive "tt.fadeonclick", ->

  return {
    restrict:   "EACM"

    link: (scope, element)->
      element.on 'click', ->
        element.fadeOut 'slow'
  }
