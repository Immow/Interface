local MainMenu = {}
local Button = require("button")



Button.new({x = 100, y = 100, w = 200, h = 70, text = "Play Game", state = "mainmenu", fn = function () StateManager:setState("game") end})
Button.new({x = 100, y = 200, w = 200, h = 70, text = "Credits", state = "mainmenu", fn = function () end})
Button.new({x = 100, y = 300, w = 200, h = 70, text = "Quit Game", state = "mainmenu", fn = function () love.event.quit() end})

function MainMenu:load()
end

function MainMenu:mousepressed(mx, my, mouseButton)
	Button:mousepressed(mx, my, mouseButton)
end

function MainMenu:draw()
	Button:draw()
end

function MainMenu:update(dt)
	Button:update(dt)
end

return MainMenu