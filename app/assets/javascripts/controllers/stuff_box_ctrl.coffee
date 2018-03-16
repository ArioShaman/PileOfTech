app.controller 'StuffBoxCtrl', [
  '$scope', '$http', '$rootScope', 'action', '$location',
  ($scope, $http, $rootScope, action, $location) ->

    ctrl = this

    openCap = () ->
      $('.top-cap').addClass('top-cap-anim')
      $('.bot-cap').addClass('bot-cap-anim')

    openSides = () ->
      $('.left-cap').addClass('left-cap-anim')
      $('.right-cap').addClass('right-cap-anim')      

    background = () ->
      $('.stuff-container').addClass('visib')

    position = () ->
      pos = $('.bottom').offset() 
      $('.real-stuff').css({
        top: pos.top - 50,
        left: pos.left
      })

    top = (i, currpos) ->
      $('.real-stuff').eq(i).addClass('toper')
      $('.real-stuff').eq(i).animate({top: currpos.top - 110, left: currpos.left})

    toBlock = () ->
      poss = []
      $('.stuff-bl').each(() ->
        pos = $(this).offset()
        poss.push pos 
      )
      len = $('.real-stuff').length

      i = 0
      setTimeout(toper = ()-> 
        if(i < len)
          currpos = poss[i]
          setTimeout(top(i, currpos), 500)
          
          i++
          setTimeout(toper, 500)
      ,500)

    action 'index', () ->
      $('.scotch').click ->
        $('.scotch').addClass('fly')
        setTimeout(openCap, 10)
        setTimeout(openSides, 600)
        setTimeout(background, 1700)
        setTimeout(position, 600)
        setTimeout(toBlock, 1800)

    action 'town', () ->
      console.log 'town'
    return
]
