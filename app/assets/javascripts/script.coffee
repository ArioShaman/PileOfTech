$(document).ready -> 

  $('.menu-icon').click -> 
      $('.menu').toggleClass('menu-field')
      $('.menu-icon').toggleClass('bottom')
      $('body').toggleClass('not-overflow')
      $('.content').toggleClass('open')

  $('a.menu-link').click ->
    $('.menu').toggleClass('menu-field')
    $('.menu-icon').toggleClass('bottom')
    $('.content').toggleClass('open')