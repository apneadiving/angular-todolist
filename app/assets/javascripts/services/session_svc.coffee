App.instance.factory 'sessionSvc', [ '$resource', '$http', ($resource, $http)->

  data =
    logged_in: false
    user:      {}

  service = $resource "/api/users/:controller", { controller: '@controller' }, {
    signin:   { method: 'POST',    params: { controller: 'sign_in'} }
    signup:   { method: 'POST'   }
    signout:  { method: 'DELETE',  params: { controller: 'sign_out'}  }
  }

  base_success_callback = (callback)->
    (response)->
      if response.status is 'ok'
        data.logged_in = true
        data.user      = response.user
        callback(true)
      else
        callback(false)

  base_error_callback = (callback)->
    (response)->
      signin_callback(false)

  signin_success_callback = (signin_callback)->
    base_success_callback(signin_callback)

  signin_failure_callback = (signin_callback)->
    base_error_callback(signin_callback)

  signout_success_callback = (signout_callback)->
    (response)->
      factory.clear_session()
      signout_callback(true)

  signout_failure_callback = (signout_callback)->
    base_error_callback(signout_callback)

  signup_success_callback = (signup_callback)->
    base_success_callback(signup_callback)

  signup_failure_callback = (signup_callback)->
    base_error_callback(signup_callback)


  factory =

    signin: (user, callback)->
      service.signin { user: user }, signin_success_callback(callback), signin_failure_callback(callback)

    signup: (user, callback)->
      service.signup { user: user }, signup_success_callback(callback), signup_failure_callback(callback)

    signout: (callback)->
      service.signout {}, signout_success_callback(callback), signout_failure_callback(callback)

    clear_session: ->
      data.logged_in = false
      data.user      = {}

    check_session_on_server: (callback)->
      $http.get('/api/check_status').
      success(base_success_callback(callback)).
      error(->(callback(false)))

    session: ->
      data

    is_logged: ->
      data.logged_in

  factory
]
