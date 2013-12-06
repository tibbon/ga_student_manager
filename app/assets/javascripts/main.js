'use strict';

/* App Module */

var studentManagerApp = angular.module('studentManagerApp', [
  'ngRoute',
  'studentControllers'
]);

studentManagerApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/students', {
        templateUrl: 'assets/student-list.html',
        controller: 'StudentListCtrl'
      }).
      when('/students/:studentId', {
        templateUrl: 'assets/student-detail.html',
        controller: 'StudentDetailCtrl'
      }).
      otherwise({
        redirectTo: '/students'
      });
  }]);
