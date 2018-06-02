app.controller 'MainCtrl', [
  '$scope', '$document', 'action','$translate',
  ($scope, $document, action, $translate) -> 
    $scope.lang = 'ru'
    $document.scrollTo(0, 0)
    ctrl = this

    click = false
    action 'about', () ->
      $scope.name = ""
      $scope.position = ""
      DanName = "Даниил Матвеев"
      KostyaName = "Константин Кравченко"
      VladName = "Влад Клименко"
      DanPosition = "back-end разработчик"
      VladPosition = "web-дизайнер"

      $scope.isDan = false
      $scope.isVlad = false
      $scope.dan = {
        "Навыки": [
            "HTML(HTML5), CSS(CSS3)", "JS, JQuery, AngularJs",
            "Ruby on Rails, Python(Flask)", "Database(PostgreSQL, MySQL, SQLite)"
          ],
        "Личностные навыки": [
          "Критическое мышление",
          "Професиональное отношение к работе",
          "Легко нахожу общий язык",
          "Творческий подход в любом деле"
        ],
        "Любимая цитата": ['"Чтобы выигрывать, прежде всего нужно играть."',
          '© Альберт Эйнштейн']
      }   
      $scope.vlad = {
        "Навыки": [
            "Растровая, векторная - графика",
            "Photoshop, Illustator",
            "Создание макетов сайтов"
          ],
        "Личностные навыки": [
          "Справедлив",
          "Целеустремлённый",
          "Упрямый",
          "Добрый в душе",
          "Коммуникабельный"
        ],
        "Любимая цитата": ['"Жизнь- это череда поступков и их последствий."',
          '© Влад Клименко']
      }   

      $scope.tab = (name)->
        $scope.isDan = false
        $scope.isVlad = false
        $scope.isKostya = false        
        if (name == 'vlad')
          $scope.isVlad = true
          $scope.name = VladName
          $scope.position = VladPosition
        if (name == 'dan')
          $scope.isDan = true
          $scope.name = DanName
          $scope.position = DanPosition


      $('.sidebar-el').click ->
        $('.sidebar-el').removeClass('active')
        $(this).toggleClass('active')
        $('.profile-info-bl').addClass('open')
      $('.close-but').click ->
        $('.sidebar-el').removeClass('active')
        $('.profile-info-bl').removeClass('open')

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


    return
]
