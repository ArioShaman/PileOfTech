app.controller 'MainCtrl', [
  '$scope', '$document', 'action',
  ($scope, $document, action) -> 

    $document.scrollTo(0, 0)
    ctrl = this
    action 'index', () ->

    return
]
