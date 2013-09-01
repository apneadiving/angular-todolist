App.instance.factory 'notificationsSvc', ->

  notifications = {
    all: []
  }

  _append_notification = (notification)->
    notifications.all.push notification

  factory =

    add: (type, message)->
      _append_notification
        type:    type
        message: message

    get: ->
      notifications

  factory
