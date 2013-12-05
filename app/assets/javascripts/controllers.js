'use strict';

/* Controllers */

var studentControllers = angular.module('studentControllers', []);

studentControllers.controller('StudentListCtrl', ['$scope', '$http',
  function($scope, $http) {
    $http.get('users.json').success(function(data) {
      $scope.students = data;
    });

    $scope.orderProp = 'age';
  }]);

studentControllers.controller('PhoneDetailCtrl', ['$scope', '$routeParams', '$http',
  function($scope, $routeParams, $http) {
    $http.get('phones/' + $routeParams.phoneId + '.json').success(function(data) {
      $scope.phone = data;
    });
  }]);
