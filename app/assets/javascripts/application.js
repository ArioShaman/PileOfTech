/*
= require oxymoron/underscore
= require oxymoron/angular
= require oxymoron/angular-resource
= require oxymoron/angular-cookies
= require oxymoron/angular-ui-router
= require oxymoron/ng-notify
= require oxymoron/angular-animate
= require oxymoron
= require jquery3
= require jquery_ujs
= require slick
= require_self
= require_tree ./controllers
= require angular-slick-carousel
= require angular-scroll
= require angular-translate
= require script
= require translate
= require ngstorage
= require angular-sanitize
= require translate
= require_tree ./configs
= require_tree ./directives
*/

var app = angular.module('app', ['ui.router','oxymoron', 'ngAnimate', 'duScroll', 'pascalprecht.translate', 'ngStorage', 'ngSanitize']);

app.config(['$stateProvider', function ($stateProvider) {
  $stateProvider.rails()
}])

app.config(['$translateProvider', function ($translateProvider) {
  $translateProvider.translations('en', translationsEN);
  $translateProvider.translations('ru', translationsRU);
  $translateProvider.useSanitizeValueStrategy('escapeParameters');
}])

app.run(['$rootScope','$location', '$localStorage', '$translate', function($rootScope, $location, $localStorage, $translate){
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

  $rootScope.lang = 'ru'
  $localStorage.lang = 'ru'
  if($localStorage.lang){
    $rootScope.lang = $localStorage.lang;
  }else{
    $.get("https://api.ipdata.co", function (response) { 
      code = response['country_code'].toLowerCase();
      if (code != 'ru'){
        code = 'en';
      }
      $rootScope.lang = code;
      $localStorage.lang = code;
    }, "jsonp");
  }
  $translate.use($localStorage.lang); 
  $('.lang-back').addClass($localStorage.lang);  

  $(document).on("click", ".lang-back", function(){
    if($rootScope.lang == 'ru'){
      $rootScope.lang = 'en';
      $localStorage.lang = 'en';
      $translate.use('en');
      $('.lang-back').removeClass('ru'); 
      $('.lang-back').addClass('en'); 
    }else{
      $rootScope.lang = 'ru';
      $localStorage.lang = 'ru';
      $translate.use('ru');
      $('.lang-back').removeClass('en'); 
      $('.lang-back').addClass('ru');           
    }     
  });
}]);

