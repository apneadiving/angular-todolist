App.instance.factory "Task", [ "$resource", ($resource)->

  service = $resource "api/tasks/:id/:controller", { id: '@id', controller: '@controller' }, {
    index:    { method: 'GET', isArray: true }
    get:      { method: 'GET' }
    update:   { method: 'PUT' }
    complete: { method: 'PUT', params: { controller: 'complete' } }
    reset:    { method: 'PUT', params: { controller: 'reset'    } }
  }


  class TaskModel

    edit_path: ->
      "#/tasks/#{ @id }/edit"

  factory =
    index: (args, callback)->
      service.index args, factory.build_nested_collection(callback)

    get: (args, callback)->
      service.get args, factory.build_object(callback)

    complete: (args, callback)->
      service.complete args, factory.build_object(callback)

    reset: (args, callback)->
      service.reset args, factory.build_object(callback)

    build: (params = {})->
      new service(params)

  angular.extend factory, App.ResourceExtension(TaskModel, { })

  factory
]
