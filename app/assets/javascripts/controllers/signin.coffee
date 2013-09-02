App.Controllers.Signin = ['$scope', 'sessionSvc', 'notificationsSvc', '$state', ($scope, sessionSvc, notificationsSvc, $state)->

  $scope.user = {}

  $scope.signin = ->
    sessionSvc.signin $scope.user, (success)->
      if success
        notificationsSvc.add 'success', 'You logged in successfully'
        $state.transitionTo('tasks')
      else
        notificationsSvc.add 'error', 'Auth Error'
]
