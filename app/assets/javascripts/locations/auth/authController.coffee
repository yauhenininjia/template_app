angular.module('templateApp')
  .controller('authController', ['$scope', '$http', '$auth', '$state', 'user', 'Flash', ($scope, $http, $auth, $state, user, Flash) ->
    $scope.signIn = user.signIn

    $scope.signUp = user.signUp
])