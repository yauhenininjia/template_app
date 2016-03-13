angular.module('templateApp')
  .factory('user', ['$rootScope', '$auth', '$state', 'Flash', ($rootScope, $auth, $state, Flash) ->
    user = 
      currentUser: null

    scope = $rootScope.$new()

    scope.$on 'auth:login-success', (e, usr) ->
      user.currentUser = usr
      message = '<strong> Wellcome!</strong>  You authenticated successfully.'
      id = Flash.create('success', message, 0, {}, true)
      $state.go 'users'

    scope.$on 'auth:registration-email-success', (e, usr) ->
      user.currentUser = usr
      $state.go 'users'

    scope.$on 'auth:logout-success', (e) ->
      user.currentUser = null

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