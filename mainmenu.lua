local MainMenu = {}
local Button = require("button")

Button.new({w = BUTTON_W, h = BUTTON_H, text = "Play Game", state = "mainmenu", align = "center", fn = function () StateManager:setState("game") end})
Button.new({w = BUTTON_W, h = BUTTON_H, text = "Credits", state = "mainmenu", align = "center", offsetY = 5, fn = function () StateManager:setState("credits") end})
Button.new({w = BUTTON_W, h = BUTTON_H, text = "Quit Game", state = "mainmenu", align = "center", offsetY = 5, fn = function () love.event.quit() end})
Button.new({w = BUTTON_W, h = BUTTON_H, text = "Quit Game", state = "mainmenu", align = "center", offsetY = 5, fn = function () love.event.quit() end})

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