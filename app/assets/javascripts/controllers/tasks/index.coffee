App.Controllers.Tasks.Index = ['$scope', 'Task', ($scope, Task)->

  Task.index {}, (response)->
    $scope.tasks = response

]
