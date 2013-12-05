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
      when('/phones/:phoneId', {
        templateUrl: 'views/phone-detail.html',
        controller: 'PhoneDetailCtrl'
      }).
      otherwise({
        redirectTo: '/students'
      });
  }]);
