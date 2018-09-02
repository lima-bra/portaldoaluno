/*Validação de email pesquisada na documentação do AngularJS: API: input[email]*/
angular.module('emailExample', []).controller('ViewModelValidation',
		[ '$scope', function($scope) {
			$scope.email = {
				text : 'me@example.com'
			};
		} ]);

angular.module('ngRequiredExample', [])
.controller('ExampleController', ['$scope', function($scope) {
  $scope.required = true;
}]);