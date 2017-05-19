_W = display.contentWidth
_H = display.contentHeight


--Requisita o storyboard e cria uma nova cena
local storyboard = require("storyboard")
local scene = storyboard.newScene()

--Adiciona som ao game
bgSound = audio.loadStream("sounds/score.mp3")

function scene:createScene(event)
  local group = self.view

  --Adiciona o background
  local background = display.newImage("images/BackgroundScores.png")
	  background.x = _W/2
    background.y = _H/2
    group:insert(background)

  scoreFinal = (scoreFinal)
  pontuacaoFinal = display.newText(scoreFinal, _W/2, _H/2-100,"actionj",160)
  pontuacaoFinal:setFillColor( 1,0.7,0.05 )
    group:insert(pontuacaoFinal)

  tryAgain = display.newImage("images/TryAgain1.png")
    tryAgain.x = _W/2
    tryAgain.y = _H/2+50
    tryAgain.xScale = 0.7
    tryAgain.yScale = 0.7
    tryAgain.alpha = 1
    group:insert(tryAgain)


tryAgainOFF = display.newImage("images/TryAgain2.png")
    tryAgainOFF.x = _W/2
    tryAgainOFF.y = _H/2+50
    tryAgainOFF.xScale = 0.7
    tryAgainOFF.yScale = 0.7
    tryAgainOFF.alpha = 0
    group:insert(tryAgainOFF)

  function goto_Game()
    tryAgain.alpha = 0
    tryAgainOFF.alpha = 1
    storyboard.gotoScene("game", transicaoCena)
  end
  tryAgain:addEventListener("tap", goto_Game)

  menu = display.newImage("images/Menu1.png")
    menu.x = _W/2
    menu.y = _H/2+190
    menu.xScale = 0.7
    menu.yScale = 0.7
    menu.alpha = 1
    group:insert(menu)

  menuOFF = display.newImage("images/Menu2.png")
    menuOFF.x = _W/2
    menuOFF.y = _H/2+190
    menuOFF.xScale = 0.7
    menuOFF.yScale = 0.7
    menuOFF.alpha = 0
    group:insert(menuOFF)


  function game_menu()
    menu.alpha = 0
    menuOFF.alpha = 1
    storyboard.gotoScene("menu")
  end
  menu:addEventListener("tap", game_menu)  
end

function scene:enterScene(event)
  local group = self.view;
  storyboard.removeScene("menu")
  storyboard.removeScene("game")
  if sound == true then  
    bgSoundChannelGame = audio.play(bgSound, {channel = 4, loops = -1});
  end  
end

function scene:exitScene( event )
  local group = self.view;
  transition.cancel()
	display.remove(background)
  display.remove(tryAgain)
  display.remove(menu)
  display.remove(scores)
  display.remove(Bird1Left)
  display.remove(Bird2Left)
  display.remove(Bird3Left)
  display.remove(Bird4Left)
  display.remove(Bird1Right)
  display.remove(Bird2Right)
  display.remove(Bird3Right)
  display.remove(Bird4Right)
  display.remove(coco)
  display.remove(pontuacaoFinal)
	menu:removeEventListener("tap", game_menu)
	audio.stop()
end

--Recebe os metodos criados
scene:addEventListener("createScene", scene)

scene:addEventListener("enterScene", scene)

scene:addEventListener("exitScene", scene)

return scene

 








