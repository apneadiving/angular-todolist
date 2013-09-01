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
        .state "root",
          url: "/"
          template:   JST['templates/tasks/index']()
          controller:  App.Controllers.Tasks.Index

        .state "tasks",
          url: "/tasks"
          abstract: true
          template:  "<div ui-view></div>"

        .state "tasks.new",
          url: "/new"
          template:    JST['templates/tasks/new']()
          controller:  App.Controllers.Tasks.New

        .state "tasks.edit",
          url: "/{id}/edit"
          template:    JST['templates/tasks/edit']()
          controller:  App.Controllers.Tasks.Edit

    ]

