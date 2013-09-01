App.Controllers.Tasks.Index = ['$scope', 'Task', 'notificationsSvc', '$window',  ($scope, Task, notificationsSvc, $window)->

  base_success_callback = ->
    notificationsSvc.add('success', 'Task successfully updated')

  base_failure_callback = ->
    notificationsSvc.add('error', 'Cannot update the task, sorry...')

  delete_success_callback = (task)->
    ->
      $scope.tasks = _.without($scope.tasks, task)
      notificationsSvc.add('success', 'Task successfully updated')

  delete_failure_callback = ->
    notificationsSvc.add('error', 'Cannot destroy the task, sorry...')


  Task.index {}, (response)->
    $scope.tasks = response

  $scope.toggleTaskStatus = (task)->
    if task.completed
      Task.complete { id: task.id }, base_success_callback, base_failure_callback
    else
      Task.reset { id: task.id }, base_success_callback, base_failure_callback

  $scope.removeTask = (task)->
    deleteTask = $window.confirm('Are you absolutely sure you want to delete?')
    if deleteTask
      task.$remove delete_success_callback(task), delete_failure_callback


]
