App.instance.factory 'notificationsSvc', ->

  notifications = {
    all: []
  }

  _append_notification = (notification)->
    notifications.all.push notification

  factory =

    add: (type, message, animation = 'autofade')->
      _append_notification
        type:    type
        message: message
        animation: animation

    get: ->
      notifications

  factory
