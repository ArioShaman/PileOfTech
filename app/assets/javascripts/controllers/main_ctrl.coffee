app.controller 'MainCtrl', [
  '$scope', '$document', 'action','$translate',
  ($scope, $document, action, $translate) -> 
    $scope.lang = 'ru'
    $document.scrollTo(0, 0)
    ctrl = this

    click = false
    action 'about', () ->

      $scope.list = []
      $scope.name = ""
      $scope.position = ""
      DanName = "Даниил Матвеев"
      KostyaName = "Константин Кравченко"
      VladName = "Влад Клименко"
      DanPosition = "back-end разработчик"
      KostyaPosition = "manager"
      VladPosition = "web-дизайнер"
      dan = {
        "Навыки": [
            "HTML(HTML5), CSS(CSS3)", "JS, JQuery, AngularJs",
            "Ruby on Rails", "Database(PostgreSQL, MySQL, SQLite)",
            "Python, C/c++. Java "
          ],
        "Личностные навыки": [
          "Критическое мышление",
          "Професиональное отношение к работе",
          "Общительный",
          "Легко находижу общий язык",
          "Творческий подход в любом деле"
        ],
        "Любимая цитата": ['"Чтобы выигрывать, прежде всего нужно играть."',
          '© Альберт Эйнштейн']
      }   
      vlad = {
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

      kostya = {
        "Навыки": [
            "SMM",
            "Маркетинг",
            "Продвижение"
          ],
        "Личностные навыки": [
            "Креативный",
            "Справедливый",
            "Решительный",
            "Целеустремленный",
            "Коммуникабельный"
        ],
        "Любимая цитата": ['"Ты родился оригиналом,не умри копией..."',
          '© Джон Мэйсон']
      }         
      
      $scope.tab = (name)->
        if (name == 'vlad')
          $scope.list = vlad
          $scope.name = VladName
          $scope.position = VladPosition
        if (name == 'dan')
          $scope.list = dan
          $scope.name = DanName
          $scope.position = DanPosition
        if (name == 'kostya')
          $scope.list = kostya
          $scope.name = KostyaName
          $scope.position = KostyaPosition

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


      nextId = (target) ->
        if parseInt(target) == lastItem then target = 0 else target = parseInt(target) + 1 
        target
      prevId =(target) ->
        if parseInt(target) == 0 then target = lastItem else target = target-1
        target

      images = $('.gallery-el')
      dots = $('.dot')
      lastItem =  images.length - 1
      for i in [0..lastItem]
        images[i].setAttribute("id", i)
        dots[i].setAttribute("id", i)
      images
        
      console.log images
      console.log dots
      images.first().addClass('active')
      dots.first().addClass('active')

      render = (target) ->
        $('.dot').removeClass('visible')
        width = window.innerWidth 
        next = nextId(target)
        prev = prevId(target)

        if width < 767
          $('#'+target+'.dot').addClass('visible')
          $('#'+next+'.dot').addClass('visible')
        else
           $('#'+prev+'.dot').addClass('visible')
          $('#'+target+'.dot').addClass('visible')
          $('#'+next+'.dot').addClass('visible')
        
      render($('.gallery-el.active').attr('id'))


      sliderResponse = (target, prev, side) ->
        render(target)
        images.removeClass('active')
        dots.removeClass('active')
        $('#'+target+'.dot').addClass('active')
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

      $('.dot').click () ->
        id = $(this).attr('id')
        activeEl = $('.gallery-el.active') 
        activeId = activeEl.attr('id')
        if id != activeId
          dots.removeClass('active')
          images.removeClass('active')        
          $('#'+id+'.dot').addClass('active')
          $('.gallery-el#'+id).addClass('active') 

          side = ''
          if id > activeId
            side = 'Right'
          else if id < activeId
            side = 'Left'

          $(".gallery-el.active").toggleClass("slide"+side)
          setTimeout( ->
             $(".gallery-el.active").toggleClass("slide"+side)
          , 700)   

          $(".gallery-el").removeClass("hideSlide")
          activeEl.toggleClass("hideSlide")

    return
]
