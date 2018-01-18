$(document).ready -> 
  $('.menu-icon').click -> 
      $('.menu').toggleClass('menu-field')
      $('.menu-icon').toggleClass('bottom')
      $('body').toggleClass('not-overflow')
      $('.content').toggleClass('open')


  # images = $('.gallery-el')
  # lastItem =  images.length - 1
  # for i in [0..lastItem]
  #   images[i].setAttribute("id", i)
  
  # images.first().addClass('active')

  # sliderResponse = (target, prev, side) ->
  #   images.removeClass('active')
  #   $('.gallery-el#'+target).addClass('active')
  #   $(".gallery-el.active").toggleClass("slide"+side)
  #   setTimeout( ->
  #      $(".gallery-el.active").toggleClass("slide"+side)
  #   , 700)    
  #   $(".gallery-el#"+prev).addClass("hideSlide")
  #   setTimeout( ->
  #      $(".gallery-el.active").toggleClass("slide"+side)
  #   , 700)       
      

  # $('.next').click () ->   
  #   target = $('.gallery-el.active').attr('id')
  #   prev = target
  #   if parseInt(target) == lastItem then target = 0 else target = parseInt(target) + 1 
  #   sliderResponse(target, prev, 'Right')

  # $('.last').click () ->   
  #   target = $('.gallery-el.active').attr('id')
  #   prev = target
  #   if parseInt(target) == 0 then target = lastItem else target = target-1
  #   sliderResponse(target, prev, 'Left')