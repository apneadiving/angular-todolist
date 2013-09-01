App.instance.factory "Task", [ "$resource", ($resource)->

  service = $resource "api/tasks/:id/:controller", { id: '@id', controller: '@controller' }, {
    create:   { method: 'POST' }
    index:    { method: 'GET', isArray: true }
    show:     { method: 'GET' }
    update:   { method: 'PUT' }
    destroy:  { method: 'DELETE' }
    complete: { method: 'PUT', params: { controller: 'complete' } }
    reset:    { method: 'PUT', params: { controller: 'reset'    } }
  }

  service
]
