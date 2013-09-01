@App =

  filters: angular.module('filters', [])

  instance: angular.module('App', ['ngResource', 'filters', 'ui.compat'])

  Lib:
    Map: {}

  Controllers:
    Tasks: {}


  init: ->

    @instance.config [ "$httpProvider", "$stateProvider", ($httpProvider, $stateProvider)->

      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

      $stateProvider
        .state "tasks",
          url: ""
          template:   JST['templates/tasks/index']()
          controller:  App.Controllers.Tasks.Index


    ]

