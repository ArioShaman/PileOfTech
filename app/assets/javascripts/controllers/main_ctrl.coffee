app.controller 'MainCtrl', [
  '$scope', '$document', 'action','$translate',
  ($scope, $document, action, $translate) -> 
    $scope.lang = 'ru'
    $document.scrollTo(0, 0)
    ctrl = this

    action 'about', () ->      
      nextId = (target) ->
        if parseInt(target) == lastItem then target = 0 else target = parseInt(target) + 1 
        target
      prevId =(target) ->
        if parseInt(target) == 0 then target = lastItem else target = target-1
        target

      images = $('.slider-el')
      lastItem =  images.length - 1
      for i in [0..lastItem]
        images[i].setAttribute("id", i)
      
      images
      images.first().addClass('active')

      sliderResponse = (target, prev, side) ->
        images.removeClass('active')
        $('.slider-el#'+target).addClass('active')
        $(".slider-el.active").toggleClass("slide"+side)
        setTimeout( ->
           $(".slider-el.active").toggleClass("slide"+side)
        , 700)    
        $(".slider-el").removeClass("hideSlide")
        $(".slider-el#"+prev).toggleClass("hideSlide")


      $('.next').click () ->   
        target = $('.slider-el.active').attr('id')
        prev = target
        target = nextId(target)
        sliderResponse(target, prev, 'Right')

      $('.last').click () ->   
        target = $('.slider-el.active').attr('id')
        prev = target
        target = prevId(target)
        sliderResponse(target, prev, 'Left')  
          

    action 'gallery', () ->
      $scope.name = 'Dan'


      nextId = (target) ->
        if parseInt(target) == lastItem then target = 0 else target = parseInt(target) + 1 
        target
      prevId =(target) ->
        if parseInt(target) == 0 then target = lastItem else target = target-1
        target

      images = $('.gallery-el')
      lastItem =  images.length - 1
      for i in [0..lastItem]
        images[i].setAttribute("id", i)
      
      images
      images.first().addClass('active')

      sliderResponse = (target, prev, side) ->
        images.removeClass('active')
        $('.gallery-el#'+target).addClass('active')
        $(".gallery-el.active").toggleClass("slide"+side)
        setTimeout( ->
           $(".gallery-el.active").toggleClass("slide"+side)
        , 700)    
        $(".gallery-el").removeClass("hideSlide")
        $(".gallery-el#"+prev).toggleClass("hideSlide")


      $('.next').click () ->   
        target = $('.gallery-el.active').attr('id')
        prev = target
        target = nextId(target)
        sliderResponse(target, prev, 'Right')

      $('.last').click () ->   
        target = $('.gallery-el.active').attr('id')
        prev = target
        target = prevId(target)
        sliderResponse(target, prev, 'Left')  

    return
]
