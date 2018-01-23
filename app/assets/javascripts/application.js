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
= require ammap
= require worldLow
= require angular-scroll
= require angular-translate
= require jquery3
= require jquery_ujs
= require script
= require translate
= require ngstorage
= require_tree ./configs
= require_tree ./directives
*/
var app = angular.module('app', ['ui.router','oxymoron', 'ngAnimate', 'duScroll', 'pascalprecht.translate', 'ngStorage']).value('duScrollBottomSpy', false);

app.config(['$stateProvider', function ($stateProvider) {
  $stateProvider.rails()
}])

app.config(['$translateProvider', function ($translateProvider, $rootScope) {

  $translateProvider.translations('en', translationsEN);
  $translateProvider.translations('ru', translationsRU);
}])



