app.controller 'ProfilesCtrl', [
  '$scope', '$http', '$rootScope', 'action', '$location',
  ($scope,   $http,   $rootScope,   action,   $location) ->

    ctrl = this

    $scope.gallery = true
    $scope.coming = false

    $('.link-el').click ->
      $('.link-el').removeClass('active')
      $(this).addClass('active')

    action 'index', () ->
      $scope.projects = []
      $http(
          method : "GET",
          url : "profiles.json"
      ).then((response) ->
          $scope.projects = response.data
          console.log $scope.projects
      )
    return
]
