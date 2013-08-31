@App =

  filters: angular.module('filters', [])

  instance: angular.module('App', ['ngResource', 'filters'])

  Lib:
    Map: {}

  Controllers:
    Tasks: {}


  init: ->

    @instance.config [ "$httpProvider", "$stateProvider", "$routeProvider", "$locationProvider", ($httpProvider, $stateProvider, $routeProvider, $locationProvider)->

      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

      $stateProvider
        .state "tasks",
          url: "/tasks"
          templateUrl: ''
          controller:  ''


    ]

