angular.module('templateApp')
  .factory('user', ['$rootScope', '$auth', '$state', 'Flash', ($rootScope, $auth, $state, Flash) ->
    user = 
      currentUser: null

    scope = $rootScope.$new()

    scope.$on 'auth:login-success', (e, usr) ->
      user.currentUser = usr
      message = '<b>Welcome!</b>  You was authenticated successfully.'
      id = Flash.create('success', message, 0, {}, true)
      $state.go 'users'

    scope.$on 'auth:login-error', (e, reason) ->
      reason.errors.forEach (error, index, errors) ->
        message = '<b>Error! </b>' + error
        id = Flash.create('danger', message, 0, {}, true)

    scope.$on 'auth:registration-email-success', (e, usr) ->
      user.currentUser = usr
      message = '<b>Success!</b> Your registration was successfull.'
      id = Flash.create('success', message, 0, {}, true)
      $state.go 'users'

    scope.$on 'auth:logout-success', (e) ->
      user.currentUser = null
      message = '<b>Success!</b> You was logout successfully.'
      id = Flash.create('success', message, 0, {}, true)

    scope.$on 'auth:validation-success', (e, usr) ->
      user.currentUser = usr

    user.signIn = (loginForm) ->
      $auth.submitLogin loginForm

    user.signUp = (loginForm) ->
      $auth.submitRegistration loginForm if loginForm.password == loginForm.password_confirmation
        
    user.signOut = () ->
      $auth.signOut()

    user.isSignedIn = () ->
      user.currentUser != null

    return user
])