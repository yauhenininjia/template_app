angular.module('templateApp')
  .controller('authController', ['$scope', '$http', '$auth', '$rootScope', function($scope, $http, $auth, $rootScope) {
    $scope.signIn = function(loginForm) {
      $auth.submitLogin(loginForm);
    };

    $scope.signUp = function(loginForm) {
      if(loginForm.password === loginForm.password_confirmation) {
        $auth.submitRegistration(loginForm)
      }
    }

    $rootScope.$on('auth:login-success', function(e, user) {
      console.log(user);
    })

    $rootScope.$on('auth:registration-email-success', function(e, user) {
      console.log(user);
    })
  }]);