app.controller 'StuffBoxCtrl', [
  '$scope', '$http', '$rootScope', 'action', '$location',
  ($scope, $http, $rootScope, action, $location) ->

    ctrl = this

    action 'index', () ->
      $('.stuff-box').click ->
        $('.top-cap').addClass('top-cap-anim')
        $('.bot-cap').addClass('bot-cap-anim')

    action 'town', () ->
      console.log 'town'
    return
]
