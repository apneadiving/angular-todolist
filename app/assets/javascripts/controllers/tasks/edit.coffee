App.Controllers.Tasks.Edit = ['$scope', 'Task', '$state', '$stateParams', 'notificationsSvc', ($scope, Task, $state, $stateParams, notificationsSvc)->

  get_success_callback = (task)->
    $scope.task = task

  get_error_callback  = ->
    notificationsSvc.add 'error', 'Cannot get expected task'
    $state.transitionTo('root')

  update_success_callback = (task)->
    notificationsSvc.add('success', 'Task successfully updated')
    $scope.task = task

  update_error_callback = ->
    notificationsSvc.add 'error', 'An error happened during task update'


  Task.get { id: $stateParams.id }, get_success_callback, get_error_callback


  $scope.updateTask = ->
    $scope.task.$update update_success_callback, update_error_callback

]
