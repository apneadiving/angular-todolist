App.instance.factory 'sessionSvc', [ '$resource', '$http', ($resource, $http)->

  data =
    logged_in: false
    user:      {}

  service = $resource "/api/users/:controller.json", { controller: '@controller' }, {
    signin:   { method: 'POST',    params: { controller: 'sign_in'} }
    signup:   { method: 'POST'   }
    signout:  { method: 'DELETE',  params: { controller: 'sign_out'}  }
  }

  signin_success_callback = (signin_callback)->
    (response)->
      if response.status is 'ok'
        data.logged_in = true
        data.user      = response.user
        signin_callback(true)
      else
        signin_callback(false)

  signin_failure_callback = (signin_callback)->
    (response)->
      signin_callback(false)

  signout_success_callback = (signout_callback)->
    (response)->
      factory.clear_session()
      signout_callback(true)

  signout_failure_callback = (signout_callback)->
    (response)->
      signout_callback(false)

  factory =

    signin: (user, callback)->
      service.signin { user: user }, signin_success_callback(callback), signin_failure_callback(callback)

    signup: (user)->
      service.signup(user)

    signout: (callback)->
      service.signout {}, signout_success_callback(callback), signout_failure_callback(callback)

    clear_session: ->
      data.logged_in = false
      data.user      = {}

    check_session_on_server: (callback)->
      $http.get('/api/check_status').
      success(signin_success_callback(callback)).
      error(->(callback(false)))

    session: ->
      data

    is_logged: ->
      data.logged_in

  factory
]
