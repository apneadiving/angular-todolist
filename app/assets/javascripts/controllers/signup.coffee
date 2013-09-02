App.Controllers.Signup = ['$scope', 'sessionSvc', 'notificationsSvc', '$state', ($scope, sessionSvc, notificationsSvc, $state)->

  $scope.user = {}

  $scope.signup = ->
    if $scope.user.password == $scope.user.password_confirm
      sessionSvc.signup $scope.user, (success)->
        if success
          notificationsSvc.add 'success', 'You signed up successfully'
          $state.transitionTo('tasks')
        else
          notificationsSvc.add 'error', 'Auth Error'
    else
      notificationsSvc.add 'error', 'password and password_confirmation must match'

]
