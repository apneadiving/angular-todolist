App.Controllers.Tasks.Edit = ['$scope', 'Task', '$stateParams', ($scope, Task, $stateParams)->

  Task.get { id: $stateParams.id }, (task)->
    $scope.task = task
    window.foo = task

  $scope.updateTask = ->
    $scope.task.$update()

]
