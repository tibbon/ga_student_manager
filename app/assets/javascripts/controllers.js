'use strict';

/* Controllers */

var studentControllers = angular.module('studentControllers', []);

studentControllers.controller('StudentListCtrl', ['$scope', '$http',
  function($scope, $http) {
    $http.get('users.json').success(function(data) {
      $scope.students = data;
    });

    $scope.orderProp = '-name';
  }]);

studentControllers.controller('StudentDetailCtrl', ['$scope', '$routeParams', '$http',
  function($scope, $routeParams, $http) {
    $http.get('users/' + $routeParams.studentId + '.json').success(function(data) {
      $scope.student = data;
    });
  }]);
