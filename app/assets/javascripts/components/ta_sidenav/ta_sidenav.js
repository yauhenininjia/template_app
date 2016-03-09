angular.module('templateApp')
	.directive('sideNav', function() {
		return {
			restrict: 'E',
			templateUrl: 'components/ta_sidenav/_ta_sidenav.html'
		}
	});