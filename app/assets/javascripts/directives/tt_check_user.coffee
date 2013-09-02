App.instance.directive 'tt.checkUser', ['$rootScope', '$state', 'notificationsSvc', 'sessionSvc', ($rootScope, $state, notificationsSvc, sessionSvc)->

  on_error = ->
    notificationsSvc.add('error', 'Login required')
    $state.transitionTo('root')

  factory =
    link: ->
      $rootScope.$on '$stateChangeSuccess', (event, currRoute, prevRoute)->
        if !currRoute.free_access && !sessionSvc.is_logged()
          sessionSvc.check_session_on_server (success)->
            on_error() unless success

      $rootScope.$on 'UNAUTHORIZED_PAGE', ->
        sessionSvc.clear_session()
        on_error()

  factory
]
