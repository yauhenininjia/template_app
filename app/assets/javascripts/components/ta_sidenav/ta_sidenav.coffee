angular.module('templateApp')
  .directive('sideNav', () ->
    restrict: 'E',
    templateUrl: 'components/ta_sidenav/_ta_sidenav.html'
)