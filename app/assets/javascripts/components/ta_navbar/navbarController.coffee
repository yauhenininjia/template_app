angular.module('templateApp')
  .controller('navbarController', ['$scope', '$auth', 'user', ($scope, $auth, user) ->
    $scope.user = user

    $scope.signOut = user.signOut

    $scope.isSignedIn = user.isSignedIn
])