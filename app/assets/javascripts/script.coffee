$(document).ready -> 
  $('.menu-icon').click -> 
      $('.menu').toggleClass('menu-field')
      $('.menu-icon').toggleClass('bottom')
      $('body').toggleClass('not-overflow')
      $('.content').toggleClass('open')