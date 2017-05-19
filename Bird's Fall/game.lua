--Requisita o storyboard e cria uma nova cena
local storyboard = require("storyboard")
local scene = storyboard.newScene()

--Adiciona física e gravidade
local fisica = require("physics")
fisica.start()
physics.setGravity( 0, 15 )
--fisica.setDrawMode("hybrid")

_W = display.contentWidth 
_H = display.contentHeight

--Adiciona som ao game
bgSound = audio.loadStream("sounds/Open_Highway.mp3")
Crow_Call = audio.loadStream("sounds/Crow_Call.mp3")

function scene:createScene(event)
  local group = self.view

  --Adiciona o background
  local background = display.newImage("images/BackgroundGame.jpg")
    background.x = _W/2
    background.y = _H/2
    group:insert(background)

  local cocofloor = display.newRect (_W/2, _H-100, 90, 0)--100  
    physics.addBody(cocofloor, "static") 
    cocofloor.isSensor = false  
    group:insert(cocofloor)                          

  --Adiciona o contador de score
  local score = 0
  scoreFinal = 0
  scoreNumber = display.newText(score, 95, _H-83, "zrnic___", 100)
  scoreNumber:setFillColor( 1,0.7,0.05 )
  group:insert(scoreNumber)

  --Adiciona as paredes, o chão e o teto
  local chao = display.newRect (0, _H, _W*2, 0)
    fisica.addBody(chao, "static")
    group:insert(chao)

  local teto = display.newRect (0, 0, _W*2, 0)
    fisica.addBody(teto, "static")	
    group:insert(teto)

  local esquerda = display.newRect (0, 0, 0, _H*2)
    fisica.addBody(esquerda, "static")
    group:insert(esquerda)

  local direita = display.newRect (_W, 0, 0, _H*2)
    fisica.addBody(direita, "static")
    group:insert(direita)

  --Adiciona a coco de basquete
  local coco = display.newImage("images/coco.png")
    fisica.addBody(coco, "dynamic", {radius = 30, density=0.04, friction=1, bounce=0.5})
    coco.x = _W/2   
    coco.y = _H-130 
    coco.xScale = 0.7
    coco.yScale = 0.7 
    group:insert(coco)
  -----------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------


  --Adiciona o 1º pássaro saindo da DIRETA
  local sheet1 = graphics.newImageSheet( "images/Bird1Right.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 1º pássaro
  local instance1 = display.newSprite( sheet1, { name="bird1", start=1, count=4, time=500 } )
    fisica.addBody(instance1, "static", { density=0, friction=1, bounce=0.5})
    instance1.y = math.random(_W/2-50,_W+50)
    instance1.xScale = 0.9
    instance1.yScale = 0.9
    instance1:play()
    group:insert(instance1)

  local function move_bird1( bird1 )

    if instance1.alpha == 0 then
      instance1.alpha = 1
    end  
    instance1.isSensor = false
    instance1.rotation = -5
    instance1.x = math.random(-1500,-500)
    transition.to( instance1, {x=400+800, y=math.random(_W/2-50,_W+50), time=math.random(3000,7000), onComplete=move_bird1} )
  end
  move_bird1( instance1 )


  --Adiciona o 2º pássaro saindo da DIRETA
  local sheet2 = graphics.newImageSheet( "images/Bird2Right.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 2º pássaro
  local instance2 = display.newSprite( sheet2, { name="bird2", start=1, count=4, time=500 } )
    fisica.addBody(instance2, "static", { density=0, friction=1, bounce=0.5})
    instance2.y = math.random(_W/2-50,_W+50)
    instance2.xScale = 0.9
    instance2.yScale = 0.9
    instance2:play()
    group:insert(instance2)

  local function move_bird2( bird2 )

    if instance2.alpha == 0 then
      instance2.alpha = 1
    end  
    instance2.isSensor = false
    instance2.rotation = -5
    instance2.x = math.random(-100,-50)
    transition.to( instance2, {x=550, y=math.random(_W/2-150,_W+50), time=math.random(5000,7000), onComplete=move_bird2} )
  end
  move_bird2( instance2 )


  --Adiciona o 3º pássaro saindo da DIRETA
  local sheet3 = graphics.newImageSheet( "images/Bird3Right.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 3º pássaro
  local instance3 = display.newSprite( sheet3, { name="bird3", start=1, count=4, time=500 } )
    fisica.addBody(instance3, "static", { density=0, friction=1, bounce=0.5})
    instance3.y = math.random(_W/2-50,_W+50)
    instance3.xScale = 0.9
    instance3.yScale = 0.9
    instance3:play()
    group:insert(instance3)

  local function move_bird3( bird3 )

    if instance3.alpha == 0 then
      instance3.alpha = 1
    end  
    instance3.isSensor = false
    instance3.rotation = -5
    instance3.x = math.random(-1500,-500)
    transition.to( instance3, {x=400+800, y=math.random(_W/2-150,_W+50), time=math.random(3000,7000), onComplete=move_bird3} )
  end
  move_bird3( instance3 )


  --Adiciona o 4º pássaro saindo da DIREITA
  local sheet4 = graphics.newImageSheet( "images/Bird4Right.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 4º pássaro
  local instance4 = display.newSprite( sheet4, { name="bird4", start=1, count=4, time=500 } )
    fisica.addBody(instance4, "static", { density=0, friction=1, bounce=0.5})
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

--[[================================================================================================================================]]

  --Adiciona o 5º pássaro saindo da ESQUERDA
  local sheet5 = graphics.newImageSheet( "images/Bird5Left.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 5º pássaro
  local instance5 = display.newSprite( sheet5, { name="bird5", start=1, count=4, time=500 } )
    fisica.addBody(instance5, "static", { density=0, friction=1, bounce=0.5})
    instance5.y = math.random(_W/2-50,_W+50)
    instance5.xScale = 0.9
    instance5.yScale = 0.9
    instance5:play()
    group:insert(instance5)

  local function move_bird5( bird5 )

    if instance5.alpha == 0 then
      instance5.alpha = 1
    end  
    instance5.isSensor = false
    instance5.rotation = -5
    instance5.x = math.random(500,1500)
    transition.to( instance5, {x=400-800, y=math.random(_W/2-150,_W+50), time=math.random(3000,7000), onComplete=move_bird5} )
  end
  move_bird5( instance5 )

  --Adiciona o 6º pássaro saindo da ESQUERDA
  local sheet6 = graphics.newImageSheet( "images/Bird6Left.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 6º pássaro
  local instance6 = display.newSprite( sheet6, { name="bird6", start=1, count=4, time=500 } )
    fisica.addBody(instance6, "static", { density=0, friction=1, bounce=0.5})
    instance6.y = math.random(_W/2-50,_W+50)
    instance6.xScale = 0.9
    instance6.yScale = 0.9
    instance6:play()
    group:insert(instance6)

  local function move_bird6( bird6 )

    if instance6.alpha == 0 then
      instance6.alpha = 1
    end  
    instance6.isSensor = false
    instance6.rotation = -5
    instance6.x = _W+50
    transition.to( instance6, {x=400-400, y=math.random(_W/2-150,_W+50), time=math.random(3000,7000), onComplete=move_bird6} )
  end
  move_bird6( instance6 )

  --Adiciona o 7º pássaro saindo da ESQUERDA
  local sheet7 = graphics.newImageSheet( "images/Bird7Left.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 7º pássaro
  local instance7 = display.newSprite( sheet7, { name="bird7", start=1, count=4, time=500 } )
    fisica.addBody(instance7, "static", { density=0, friction=1, bounce=0.5})
    instance7.y = math.random(_W/2-50,_W+50)
    instance7.xScale = 0.9
    instance7.yScale = 0.9
    instance7:play()
    group:insert(instance7)

  local function move_bird7( bird7 )

    if instance7.alpha == 0 then
      instance7.alpha = 1
    end  
    instance7.isSensor = false
    instance7.rotation = -5
    instance7.x = math.random(500,1500)
    transition.to( instance7, {x=400-800, y=math.random(_W/2-150,_W+50), time=math.random(5000,7000), onComplete=move_bird7} )
  end
  move_bird7( instance7 )

  --Adiciona o 8º pássaro saindo da ESQUERDA
  local sheet8 = graphics.newImageSheet( "images/Bird8Left.png", { width=95, height=85, numFrames=4 } )

  --Cria o sprite do 8º pássaro
  local instance8 = display.newSprite( sheet8, { name="bird8", start=1, count=4, time=500 } )
    fisica.addBody(instance8, "static", { density=0, friction=1, bounce=0.5})
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

  --Função que adiciona a colisão e pontuação dos pássaros 
  local function onLocalCollision( self, event )
    if ( event.phase == "began" ) then
      if event.other == instance1 then
          scoreNumber.text = tostring(tonumber(scoreNumber.text) + 2)
          scoreFinal = tonumber(scoreNumber.text)
      end
      if event.other == instance2 then
          scoreNumber.text = tostring(tonumber(scoreNumber.text) - 3)
          scoreFinal = tonumber(scoreNumber.text)
      end
      if event.other == instance3 then
          scoreNumber.text = tostring(tonumber(scoreNumber.text) + 3)
          scoreFinal = tonumber(scoreNumber.text)
      end
      if event.other == instance4 then
          scoreNumber.text = tostring(tonumber(scoreNumber.text) + 5)
          scoreFinal = tonumber(scoreNumber.text)
      end
      if event.other == instance5 then
          scoreNumber.text = tostring(tonumber(scoreNumber.text) + 2)
          scoreFinal = tonumber(scoreNumber.text)
      end
      if event.other == instance6 then
          scoreNumber.text = tostring(tonumber(scoreNumber.text) - 3)
          scoreFinal = tonumber(scoreNumber.text)
      end
      if event.other == instance7 then
          scoreNumber.text = tostring(tonumber(scoreNumber.text) + 3)
          scoreFinal = tonumber(scoreNumber.text)
      end
      if event.other == instance8 then
          scoreNumber.text = tostring(tonumber(scoreNumber.text) + 5)
          scoreFinal = tonumber(scoreNumber.text)
      end

      if event.other == chao then
        cocofloor.isSensor = false
        timer.performWithDelay( 100, resetacoco)
        coco:setLinearVelocity( 0, 0 )
        coco.angularVelocity = 0
        coco:addEventListener("touch", coco)
      end 
      if event.other == instance1 then
        transition.cancel(instance1)
        local function animate( event )
          instance1.isSensor = true
          transition.to( instance1, {time=1000, onComplete=move_bird1 } )
          transition.to( instance1, {alpha = 0, time=700})
          Song = audio.play(Crow_Call)
        end
        animate()
      end
      if event.other == instance2 then
        transition.cancel(instance2)
        local function animate( event )
          instance12isSensor = true
          transition.to( instance2, {time=1000, onComplete=move_bird2 } )
          transition.to( instance2, {alpha = 0, time=700})
          Song = audio.play(Crow_Call)
        end
        animate()
      end 
      if event.other == instance2 then
        transition.cancel(instance2)
        local function animate( event )
          instance2.isSensor = true
          transition.to( instance2, {time=1000, onComplete=move_bird2 } )
          transition.to( instance2, {alpha = 0, time=700})
          Song = audio.play(Crow_Call)
        end
        animate()
      end 
      if event.other == instance3 then
        transition.cancel(instance3)
        local function animate( event )
          instance3.isSensor = true
          transition.to( instance3, {time=1000, onComplete=move_bird3 } )
          transition.to( instance3, {alpha = 0, time=700})
          Song = audio.play(Crow_Call)  
        end
        animate()
      end 
      if event.other == instance4 then
        transition.cancel(instance4)
        local function animate( event )
          instance4.isSensor = true
          transition.to( instance4, {time=1000, onComplete=move_bird4 } )
          transition.to( instance4, {alpha = 0, time=700})
          Song = audio.play(Crow_Call)
        end
        animate()
      end 
      if event.other == instance5 then
        transition.cancel(instance5)
        local function animate( event )
          instance5.isSensor = true
          transition.to( instance5, {time=1000, onComplete=move_bird5 } )
          transition.to( instance5, {alpha = 0, time=700})
          Song = audio.play(Crow_Call) 
        end
        animate()
      end 
      if event.other == instance6 then
        transition.cancel(instance6)
        local function animate( event )
          instance6.isSensor = true
          transition.to( instance6, {time=1000, onComplete=move_bird6 } )
          transition.to( instance6, {alpha = 0, time=700})
          Song = audio.play(Crow_Call)
        end
        animate()
      end 
      if event.other == instance7 then
        transition.cancel(instance7)
        local function animate( event )
          instance7.isSensor = true
          transition.to( instance7, {time=1000, onComplete=move_bird7 } )
          transition.to( instance7, {alpha = 0, time=700})
          Song = audio.play(Crow_Call)
        end
        animate()
      end  
      if event.other == instance8 then
        transition.cancel(instance8)
        local function animate( event )
          instance8.isSensor = true
          transition.to( instance8, {time=1000, onComplete=move_bird8 } )
          transition.to( instance8, {alpha = 0, time=700})
          Song = audio.play(Crow_Call)
        end
        animate()
      end  
    end  
  end
  coco.collision = onLocalCollision
  coco:addEventListener( "collision", coco )  

  --Funcao para resetar o coco:
  function resetacoco()
    coco.x = _W/2 
    coco.y = _H - 130
  end

  --Função para atirar o coco
  function coco:touch(event)

    local t = event.target
    local phase = event.phase

    if event.phase == "began" then

      display.getCurrentStage():setFocus( t )
      t.isFocus = true
    
      local showTarget = transition.to( target, { alpha=0.4, xScale=0.4, yScale=0.4, time=200 } )
      myLine = nil

    elseif t.isFocus then
    
      if event.phase == "moved" then
  
        if ( myLine ) then
          myLine.parent:remove( myLine )
        end
      myLine = display.newLine( t.x,t.y, event.x,event.y )
      myLine:setStrokeColor( 1, 1, 1, 50/255 )
      myLine.strokeWidth = 10

    elseif event.phase == "ended" or event.phase == "cancelled" then
      
      display.getCurrentStage():setFocus( nil )
      t.isFocus = false
            
        if ( myLine ) then
          myLine.parent:remove( myLine )
          cocofloor.isSensor = true 
          coco:removeEventListener("touch", coco)
        end
          
      --Golpeia o coco:
      local cocoforce
        t:applyForce( (t.x - event.x), (t.y - event.y), t.x, t.y )
      end
    end
    return true
  end
  coco:addEventListener("touch", coco)

  --Adiciona o cronômetro
  local tempo = display.newText( "01:00", 0, 0, "zrnic___", 90 )
    tempo:setFillColor( 1,0.7,0.05 )
    tempo.x = _W/2
    tempo.y = 80
    group:insert(tempo)
   
  local number = 60
  local modf = math.modf

  function timerDown()
    number = number - 1
    local start_seconds = number

    local start_minutes = modf(start_seconds/60)
    local seconds       = start_seconds - start_minutes*60

    local start_hours = modf(start_minutes/60)
    local minutes     = start_minutes - start_hours*60

    local min = minutes < 10 and (minutes) or minutes
    local sec = seconds < 10 and ("0".. seconds) or seconds

    tempo.text = min .. ":" .. sec
    group:insert(tempo)

    function countdown_red()
      if number == 5 then
        tempo:setTextColor( 1, 0, 0 )  
          if sound == true then
            countdown = audio.loadStream("sounds/contagem.mp3")
            Song = audio.play(countdown)
          end
      end 
    end
    countdown_red()

    function goto_score()
      storyboard.gotoScene("score", transicaoCena)
    end

  if(number == 0)then
    local timeout = display.newImage("images/TimeOut.png")
    timeout.x = _W/2
    timeout.y = _H/2
    group:insert(timeout)

    display.remove(instance1)
    display.remove(instance2)
    display.remove(instance3)
    display.remove(instance4)
    display.remove(instance5)
    display.remove(instance6)
    display.remove(instance7)
    display.remove(instance8)
    display.remove(coco)
    display.remove(cocofloor)
    display.remove(myLine)
    timer.performWithDelay(2000, goto_score)
    end
  end
  timerDown = timer.performWithDelay(1000, timerDown, number)  
end

function scene:enterScene(event)
  local group = self.view;
    audio.stop()
    storyboard.removeScene("menu")
    storyboard.removeScene("score") 
    if sound == true then
      BgSoundChannelGame = audio.play(bgSound, {channel = 4, loops = -1}); 
    end  
end

function scene:exitScene(event)
  local group = self.view
    display.remove(instance1)
    display.remove(instance2)
    display.remove(instance3)
    display.remove(instance4)
    display.remove(instance5)
    display.remove(instance6)
    display.remove(instance7)
    display.remove(instance8)
    display.remove(coco)
    display.remove(cocofloor)
    display.remove(myLine)
    Runtime:removeEventListener("tap", goto_score)
end

--Recebe os metodos criados
scene:addEventListener("createScene", scene)

scene:addEventListener("enterScene", scene)

scene:addEventListener("exitScene", scene)

return scene











