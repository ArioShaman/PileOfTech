app.controller 'MainCtrl', [
  '$scope', '$document', 'action',
  ($scope, $document, action) -> 

    #$document.scrollTop(0, 1000)
    $document.scrollTo(0, 0)
    ctrl = this
    action 'index', () ->

    return
]
