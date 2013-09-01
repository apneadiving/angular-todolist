App.Controllers.Tasks.New = ['$scope', 'Task', ($scope, Task)->

  reset_task = ->
    $scope.task = Task.build()

  $scope.saveTask = ->
    $scope.task.$save()
    reset_task()

  reset_task()

]
