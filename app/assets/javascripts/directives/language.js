app.directive('language', function($translate) {
  return {
    estrict: 'A',
    template: '{{lang}}',
    link: function($scope, element, attrs) {
      $scope.$watch(function(){
        element.addClass('lang-back');
        element.addClass('ru');
        element.bind('click', function() {
            attrs.$observe('language', function() {
              if($scope.lang == 'ru'){
                $scope.lang = 'en';
                $translate.use('en');
              }else{
                $scope.lang = 'ru';
                $translate.use('ru');      
              }   
            });             
        });
      });     
    },

    controller: function($scope, $translate){
      $scope.lang = 'en';
    }
  }
});