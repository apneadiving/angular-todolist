App.Controllers.Tasks.Index = ['$scope', 'Task', ($scope, Task)->

  Task.index {}, (response)->
    $scope.tasks = response

  $scope.toggleTaskStatus = (task)->
    if task.completed
      Task.complete({ id: task.id })
    else
      Task.reset({ id: task.id })

]
