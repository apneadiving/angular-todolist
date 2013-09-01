App.instance.factory "Task", [ "$resource", ($resource)->

  service = $resource "api/tasks/:id/:controller", { id: '@id', controller: '@controller' }, {
    index:    { method: 'GET', isArray: true }
    show:     { method: 'GET' }
    complete: { method: 'PUT', params: { controller: 'complete' } }
    reset:    { method: 'PUT', params: { controller: 'reset'    } }
  }


  class TaskModel

  factory =
    index: (args, callback)->
      service.index args, factory.build_nested_collection(callback)

    show: (args, callback)->
      service.show args, factory.build_object(callback)

    complete: (args, callback)->
      service.complete args, factory.build_object(callback)

    reset: (args, callback)->
      service.reset args, factory.build_object(callback)

    build: (params = {})->
      new service(params)

  angular.extend factory, App.ResourceExtension(TaskModel, { })

  factory
]
