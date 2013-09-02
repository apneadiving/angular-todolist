App.instance.factory "Task", [ "$resource", ($resource)->

  service = $resource "/api/tasks/:id/:controller", { id: '@id', controller: '@controller' }, {
    index:    { method: 'GET', isArray: true }
    get:      { method: 'GET' }
    update:   { method: 'PUT' }
    complete: { method: 'PUT', params: { controller: 'complete' } }
    reset:    { method: 'PUT', params: { controller: 'reset'    } }
  }


  class TaskModel

    edit_path: ->
      "/tasks/#{ @id }/edit"

  factory =
    index: (args, success_callback, error_callback = ->(false))->
      service.index args, factory.build_nested_collection(success_callback), error_callback

    get: (args, success_callback, error_callback)->
      service.get args, factory.build_object(success_callback), error_callback

    complete: (args, success_callback, error_callback)->
      service.complete args, factory.build_object(success_callback), error_callback

    reset: (args, success_callback, error_callback)->
      service.reset args, factory.build_object(success_callback), error_callback

    build: (params = {})->
      new service(params)

  angular.extend factory, App.ResourceExtension(TaskModel, { })

  factory
]
