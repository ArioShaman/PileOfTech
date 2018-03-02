/*
= require oxymoron/underscore
= require oxymoron/angular
= require oxymoron/angular-resource
= require oxymoron/angular-cookies
= require oxymoron/angular-ui-router
= require oxymoron/ng-notify
= require oxymoron/angular-animate
= require oxymoron
= require_self
= require_tree ./controllers
= require angular-scroll
= require angular-translate
= require jquery3
= require jquery_ujs
= require script
= require translate
= require ngstorage
= require_tree ./configs
*/
var app = angular.module('app', ['ui.router','oxymoron', 'ngAnimate', 'duScroll', 'pascalprecht.translate', 'ngStorage']);

app.config(['$stateProvider', function ($stateProvider) {
  $stateProvider.rails()
}])

// app.config(['$translateProvider', function ($translateProvider) {
//   $translateProvider.translations('en', translationsEN);
//   $translateProvider.translations('ru', translationsRU);
// }])

app.run(['$rootScope','$location', '$localStorage', function($rootScope, $location, $localStorage){
  links = $localStorage.links || []
  $localStorage.links = links

  $(document).on("click", "a.link", function(){
    attr = $location.path();
    if ($localStorage.links[$localStorage.links.length] != attr){
      $localStorage.links.push(attr)
    }
  }); 
  $(document).on("click", "a.arrow-back", function(){
    attr = $location.path();
    if($localStorage.links.length > 0){
      link = $localStorage.links[$localStorage.links.length - 1];
      $location.path(link);
      $rootScope.$apply();
      $localStorage.links.pop(attr);
    }
  });
}]);

