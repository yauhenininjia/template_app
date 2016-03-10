angular.module('templateApp')
  .controller('authController', ['$scope', '$http', '$auth', '$state', 'user', ($scope, $http, $auth, $state, user) ->
    $scope.signIn = user.signIn

    $scope.signUp = user.signUp
]);