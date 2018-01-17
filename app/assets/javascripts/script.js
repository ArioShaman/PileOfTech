$(document).ready(function() {
  $('.menu-icon').click(function() {
      $('.menu').toggleClass('menu-field');
      $('.menu-icon').toggleClass('bottom');
      $('body').toggleClass('not-overflow');
      $('.content').toggleClass('open')
  });
});