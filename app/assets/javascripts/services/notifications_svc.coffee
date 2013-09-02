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
        id:        App.Utils.generate_uuid()

    get: ->
      notifications

    mark_as_read: (notification)->
      notifications.all = _.reject notifications.all, (notif)->
        notification.id == notif.id

  factory
