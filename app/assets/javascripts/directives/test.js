app.directive('test', ['$localStorage', '$sessionStorage', 
  function($localStorage, $sessionStorage) {
    return {
      estrict: 'EA',
      link: function($scope, element, attrs) {

      },
      template: '<div>TestDirective</div>',
      replace: true,
      transclude: true,
    }
  }
]);