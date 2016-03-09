angular.module('templateApp', ['ui.router', 'templates'])
  .config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
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
      });
    $urlRouterProvider.otherwise('users');
  }])