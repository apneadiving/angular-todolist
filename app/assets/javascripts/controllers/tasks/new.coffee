App.Controllers.Tasks.New = ['$scope', 'Task', 'notificationsSvc', '$state', ($scope, Task, notificationsSvc, $state)->

  save_success_callback = (task)->
    notificationsSvc.add 'success', 'Task successfully created'
    $state.transitionTo('tasks')

  save_error_callback = ->
    notificationsSvc.add 'error', 'An error happened during task save'

  reset_task = ->
    $scope.task = Task.build()

  $scope.saveTask = ->
    $scope.task.$save save_success_callback, save_error_callback

  reset_task()

]
