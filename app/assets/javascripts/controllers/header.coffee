App.Controllers.Header = ['$scope', 'sessionSvc', 'notificationsSvc', '$state', ($scope, sessionSvc, notificationsSvc, $state)->

  $scope.session = sessionSvc.session()

  signout_callback = (success)->
    if success
      notificationsSvc.add 'success', 'Signed out'
      $state.transitionTo('root')
    else
      notificationsSvc.add 'error', 'An error occured'

  $scope.signout = ->
    sessionSvc.signout signout_callback

]
