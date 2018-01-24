app.controller 'UsersSessionsCtrl', [
  '$scope', '$http', '$rootScope', 'action', '$location', 'User',
  ($scope, $http, $rootScope, action, $location, User) ->

    ctrl = this

    $scope.commit = ->
      console.log ctrl.data
      
      $http.post('/users/sign_in.json', ctrl.data).success (data)->  
        console.log data

    
    return
]
