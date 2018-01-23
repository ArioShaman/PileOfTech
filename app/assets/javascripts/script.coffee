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


  links = ["root_path"]
  $(document).on "click", "a.link", () ->
    attr = this.getAttribute("ui-sref")
    if links[links.length - 1] != attr
      el = $('a.arrow-back') 
      el = angular.element(el)
      el.attr("ui-sref", links[links.length - 1])  
      links.push attr
    console.log links

  $(document).on "click", "a.arrow-back", () ->
    attr = this.getAttribute("ui-sref")
    if links[links.length - 1] != attr
      el = $('a.arrow-back') 
      el = angular.element(el)
      el.attr("ui-sref", links[links.length - 1])      
    if links.length > 1
      links.pop attr
    console.log links