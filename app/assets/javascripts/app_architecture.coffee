@App =

  filters: angular.module('filters', [])

  instance: angular.module('App', ['ngResource', 'filters', 'ui.compat'])

  Lib:
    Map: {}

  Controllers:
    Tasks: {}


  init: ->

    @instance.config [ "$httpProvider", "$stateProvider", '$urlRouterProvider', '$locationProvider', '$provide', ($httpProvider, $stateProvider, $urlRouterProvider, $locationProvider, $provide)->

      # $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

      $stateProvider
        .state "root",
          url: "/"
          template:    JST['templates/home']()
          controller:  App.Controllers.Home
          free_access: true

        .state "signin",
          url: "/signin"
          template:    JST['templates/signin']()
          controller:  App.Controllers.Signin
          free_access: true

        .state "signup",
          url: "/signup"
          template:    JST['templates/signup']()
          controller:  App.Controllers.Signup
          free_access: true

        .state "tasks",
          url: "/tasks"
          template:   JST['templates/tasks/index']()
          controller:  App.Controllers.Tasks.Index

        .state "new_task",
          url: "/tasks/new"
          template:    JST['templates/tasks/new']()
          controller:  App.Controllers.Tasks.New

        .state "edit_tasks",
          url: "/tasks/{id}/edit"
          template:    JST['templates/tasks/edit']()
          controller:  App.Controllers.Tasks.Edit

      $urlRouterProvider.otherwise('/')

      $provide.factory 'interceptor401', ['$rootScope', '$q', ($rootScope, $q)->

        (promise)->
          promise.then (response) ->
            response
          ,(response)->
            if response.status == 401
              $rootScope.$broadcast('UNAUTHORIZED_PAGE')
            $q.reject(response)
      ]

      $httpProvider.responseInterceptors.push('interceptor401')
      $locationProvider.html5Mode(true).hashPrefix('!');
    ]
