angular.module('templateApp')
  .factory('user', ['$rootScope', '$auth', '$state', ($rootScope, $auth, $state) ->
    user = 
      currentUser: null

    scope = $rootScope.$new()

    scope.$on 'auth:login-success', (e, usr) ->
      user.currentUser = usr
      $state.go 'users'

    scope.$on 'auth:registration-email-success', (e, usr) ->
      user.currentUser = usr
      $state.go 'users'

    scope.$on 'auth:logout-success', (e) ->
      user.currentUser = null

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