-- Requisita o storyboard e cria uma nova cena
local storyboard = require("storyboard")
local scene = storyboard.newScene()
local start

_W = display.contentWidth 
_H = display.contentHeight

-- Adiciona música em loop
bgSound1 = audio.loadStream("sounds/Crystal.mp3")

function scene:createScene( event )
  local group = self.view

  --Adiciona o background
  local background = display.newImage("images/BackgroundMenu.png")
    background.x = _W/2
    background.y = _H/2
    group:insert(background)  

  --Adiciona o botão de start
  start = display.newImage("images/Start1.png")
	  start.x = _W/2 
	  start.y = _H/2 + 110
	  start.xScale = 0.7
	  start.yScale = 0.7
    start.alpha = 1
    group:insert(start)
  --Adiciona o botão de start OFF
  startOFF = display.newImage("images/Start2.png")
    startOFF.x = _W/2 
    startOFF.y = _H/2 + 110
    startOFF.xScale = 0.7
    startOFF.yScale = 0.7
    startOFF.alpha = 0 
    group:insert(startOFF)

  --Adiciona o botão de points
  points = display.newImage("images/Points1.png")
    points.x = _W/4
    points.y = _H/2 + 230
    points.xScale = 0.7
    points.yScale = 0.7
    points.alpha = 1
    group:insert(points)  

  --Adiciona o botão de points OFF
  pointsOFF = display.newImage("images/Points2.png")
    pointsOFF.x = _W/4
    pointsOFF.y = _H/2 + 230
    pointsOFF.xScale = 0.7
    pointsOFF.yScale = 0.7
    pointsOFF.alpha = 0
    group:insert(pointsOFF)

  --Adiciona o botão de about
  about = display.newImage("images/About1.png")
    about.x = _W/2+125
    about.y = _H/2 + 230
    about.xScale = 0.7
    about.yScale = 0.7
    about.alpha = 1
    group:insert(about)

   --Adiciona o botão de about OFF
  aboutOFF = display.newImage("images/About2.png")
    aboutOFF.x = _W/2+125
    aboutOFF.y = _H/2 + 230
    aboutOFF.xScale = 0.7
    aboutOFF.yScale = 0.7
    aboutOFF.alpha = 0
    group:insert(aboutOFF)

  --Adiciona o botão de High Scores
  highScores = display.newImage("images/HighScores1.png")
    highScores.x = _W/2
    highScores.y = _H/2 + 350
    highScores.xScale = 0.7
    highScores.yScale = 0.7
    highScores.alpha = 1
    group:insert(highScores)

   --Adiciona o botão de about OFF
  highScoresOFF = display.newImage("images/HighScores2.png")
    highScoresOFF.x = _W/2
    highScoresOFF.y = _H/2 + 350
    highScoresOFF.xScale = 0.7
    highScoresOFF.yScale = 0.7
    highScoresOFF.alpha = 0
    group:insert(highScoresOFF)


  --Adiciona o pássaro saindo da DIREITA
  local sheet4 = graphics.newImageSheet( "images/Bird"..math.random(1,4).."Right.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 4º pássaro
  local instance4 = display.newSprite( sheet4, { name="bird4", start=1, count=4, time=500 } )
    instance4.y = math.random(_W/2-50,_W+50)
    instance4.xScale = 0.9
    instance4.yScale = 0.9
    instance4:play()
    group:insert(instance4)

  local function move_bird4( bird4 )

    if instance4.alpha == 0 then
      instance4.alpha = 1
    end  
    instance4.isSensor = false
    instance4.rotation = -5
    instance4.x = math.random(-3000,-100)
    transition.to( instance4, {x=400+800, y=math.random(_W/2-150,_W+50), time=math.random(6000,10000), onComplete=move_bird4} )
  end
  move_bird4( instance4 )

  --Adiciona o 8º pássaro saindo da ESQUERDA
  local sheet8 = graphics.newImageSheet( "images/Bird"..math.random(5,8).."Left.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 8º pássaro
  local instance8 = display.newSprite( sheet8, { name="bird8", start=1, count=4, time=500 } )
    instance8.y = math.random(_W/2-50,_W+50)
    instance8.xScale = 0.9
    instance8.yScale = 0.9
    instance8:play()
    group:insert(instance8)

  local function move_bird8( bird8 )

    if instance8.alpha == 0 then
      instance8.alpha = 1
    end  
    instance8.isSensor = false
    instance8.rotation = -5
    instance8.x = math.random(1000,3000)
    transition.to( instance8, {x=400-800, y=math.random(_W/2-150,_W+50), time=math.random(6000,10000), onComplete=move_bird8} )
  end
  move_bird8( instance8 )
  
  end   

  local function start_game()
    start.alpha=0
    startOFF.alpha=1
    storyboard.gotoScene("game", transicaoCena)
    --timer.performWithDelay(1000, function() storyboard.gotoScene("game", transicaoCena); end)
  end

  local function goto_points()
    points.alpha=0
    pointsOFF.alpha=1
    storyboard.gotoScene("points", transicaoCena)
  end  

  local function goto_about()
    about.alpha=0
    aboutOFF.alpha=1
    storyboard.gotoScene("about", transicaoCena)
end  

local function goto_highScores()
    highScores.alpha=0
    highScoresOFF.alpha=1
    storyboard.gotoScene("highscores", transicaoCena)
end  

function scene:enterScene( event )
  start:addEventListener("tap", start_game)
  points:addEventListener("tap", goto_points)
  about:addEventListener("tap", goto_about)
  highScores:addEventListener("tap", goto_highScores)
  storyboard.removeScene("game")
  storyboard.removeScene("score")
  storyboard.removeScene("points")
  storyboard.removeScene("about")
  storyboard.removeScene("highscores")
  if sound == true then 
    mySong1 = audio.play( bgSound1, { channel = 1, loops = -1 } )
  end  
end

function scene:exitScene( event )
  start:removeEventListener("tap", start_game)
  points:removeEventListener("tap", goto_points)
  about:removeEventListener("tap", goto_about) 
  highScores:removeEventListener("tap", goto_highScores) 
end

-- Recebe os metodos criados
scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

scene:addEventListener( "exitScene", scene )

return scene	