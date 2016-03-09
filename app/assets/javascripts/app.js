angular.module('templateApp', ['ui.router', 'templates', 'ng-token-auth'])
  .config(['$stateProvider', '$urlRouterProvider', '$authProvider',
    function($stateProvider, $urlRouterProvider, $authProvider) {
      $stateProvider
        .state('users', {
          url: '/users',
          templateUrl: 'locations/users/_users.html',
          controller: 'usersController'
        })
        .state('products', {
          url: '/products',
          templateUrl: 'locations/products/_products.html',
          controller: 'productsController'
        })
        .state('info', {
          url: '/info',
          templateUrl: 'locations/info/_info.html',
          controller: 'infoController'
        })
        .state('sign_in', {
          url: '/sign_in',
          templateUrl: 'locations/auth/_sign_in.html',
          controller: 'authController'
        })
        .state('sign_up', {
          url: '/sign_up',
          templateUrl: 'locations/auth/_sign_up.html',
          controller: 'authController'
        });
      $urlRouterProvider.otherwise('users');

      $authProvider.configure({
        apiUrl: ''
      })
    }]);