App.Controllers.Tasks.Index = ['$scope', 'Task', ($scope, Task)->

  Task.index {}, (response)->
    $scope.tasks = response

  $scope.toggleTaskStatus = (task)->
    if task.completed
      Task.complete({ id: task.id })
    else
      Task.reset({ id: task.id })

  $scope.removeTask = (task)->
    deleteTask = confirm('Are you absolutely sure you want to delete?')
    if deleteTask
      task.$remove()
      $scope.tasks = _.without($scope.tasks, task)

]
