app.controller 'MainCtrl', [
  '$scope', '$document', 'action','$translate', '$http', '$timeout',
  ($scope, $document, action, $translate, $http, $timeout) -> 
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

    $scope.projects = []
    $scope.activeProject = null
    $scope.dataLoaded = false

    $scope.carSettings = {
      dots: false,
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.small-slider',
    }

    $scope.smCarSettings = {
      asNavFor: '.slider',
      slidesToShow: 3,
      slidesToScroll: 1,
      dots: false,
      arrows: false,
      focusOnSelect: true,
      initOnload:true        
    }

    $scope.activate = (project)->
      $('.slider').addClass('disable')
      $('.small-slider').addClass('disable')
      $('.preloader').addClass('active')
      $('.slider').slick('unslick')
      $('.small-slider').slick('unslick')
      $scope.activeProject = project
      $timeout(()->
        $('.slider').slick($scope.carSettings)
        $('.small-slider').slick($scope.smCarSettings)
      , 10)
      $timeout(()->
        $('.preloader').removeClass('active')
        $('.slider').removeClass('disable')
        $('.small-slider').removeClass('disable')
      , 1200)  

    action 'sites', () ->    
      $http(
          method : "GET",
          url : "/gallery/sites.json"
      ).then((response) ->
          $scope.projects = response.data
          $scope.activate($scope.projects[0])  
          $scope.activeProject = $scope.projects[0] 
          $timeout(()->         
            $scope.dataLoaded = true
          , 1200)

          console.log $scope.projects
      )

    action 'design', () ->
      $http(
          method : "GET",
          url : "/gallery/design.json"
      ).then((response) ->
          $scope.projects = response.data
          $scope.activeProject = $scope.projects[0]   
          $timeout(()->
            $scope.dataLoaded = true
          )

          console.log $scope.projects
      )


    return
]
