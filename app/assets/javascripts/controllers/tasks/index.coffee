App.Controllers.Tasks.Index = ['$scope', 'Task', 'notificationsSvc', ($scope, Task, notificationsSvc)->

  base_success_callback = -> false
  base_failure_callback = ->
    notificationsSvc.add('error', 'Cannot update the task, sorry...')

  Task.index {}, (response)->
    $scope.tasks = response

  $scope.toggleTaskStatus = (task)->
    if task.completed
      Task.complete { id: task.id }, base_success_callback, base_failure_callback
    else
      Task.reset { id: task.id }, base_success_callback, base_failure_callback

  $scope.removeTask = (task)->
    deleteTask = confirm('Are you absolutely sure you want to delete?')
    if deleteTask
      task.$remove()
      $scope.tasks = _.without($scope.tasks, task)

]
