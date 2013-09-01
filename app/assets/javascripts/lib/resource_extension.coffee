App.ResourceExtension = (class_name, extension_options = {})->

    build_object: (callback)->
      (response)->
        resource = _.extend new class_name, response
        if _.isFunction(callback)
          callback resource
        else
          resource

    build_nested_collection: (callback)->
      (response)->
        namespace  = extension_options.namespace
        collection = if namespace then response[namespace] else response
        resources  = _.map collection, (resource)-> ( _.extend(new class_name, resource) )

        if namespace
            response[namespace] = resources
          else
            response.splice(0, response.length)
            response = response.concat resources

        if _.isFunction(callback)
          callback response
        else
          response
