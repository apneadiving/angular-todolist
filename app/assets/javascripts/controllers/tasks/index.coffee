App.Controllers.Tasks.Index = ['$scope', 'Task', 'notificationsSvc', '$window', ($scope, Task, notificationsSvc, $window)->

  base_success_callback = ->
    notificationsSvc.add('success', 'Task successfully updated')
    refresh_counters()

  base_failure_callback = ->
    notificationsSvc.add('error', 'Cannot update the task, sorry...')

  delete_success_callback = (task)->
    ->
      $scope.tasks = _.without($scope.tasks, task)
      notificationsSvc.add('success', 'Task successfully destroyed')

  delete_failure_callback = ->
    notificationsSvc.add('error', 'Cannot destroy the task, sorry...')

  pending_tasks = ->
    _.where($scope.tasks, { completed: false  } )

  completed_tasks = ->
    _.where($scope.tasks, { completed: true  } )

  get_tasks_for = (filter_name)->
    switch filter_name
      when 'completed' then return completed_tasks()
      when 'pending'   then return pending_tasks()
      else return $scope.tasks

  refresh_counters = ->
    $scope.completed_tasks = completed_tasks().length
    $scope.pending_tasks   = pending_tasks().length

  init = ->
    Task.index {}, (response)->
      $scope.tasks = response

    $scope.possibleDisplays = [ 'all', 'completed', 'pending' ]
    $scope.displayFilter    = 'all'
    $scope.orderDirection   = true

  $scope.$watch 'displayFilter', ->
    $scope.displayedTasks = get_tasks_for($scope.displayFilter)

  $scope.$watch 'tasks', ->
    $scope.displayedTasks  = get_tasks_for($scope.displayFilter)
    refresh_counters()

  $scope.toggleTaskStatus = (task)->
    if task.completed
      Task.complete { id: task.id }, base_success_callback, base_failure_callback
    else
      Task.reset { id: task.id }, base_success_callback, base_failure_callback

  $scope.removeTask = (task)->
    deleteTask = $window.confirm('Are you absolutely sure you want to delete?')
    if deleteTask
      task.$remove delete_success_callback(task), delete_failure_callback

  init()

]
