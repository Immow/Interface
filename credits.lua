local Credits = {}
local Button = require("button")

Button.new({x = 100, y = 100, w = 200, h = 70, text = "Mainmenu", state = "credits", fn = function () StateManager:setState("mainmenu") end})

function Credits:load()
end

function Credits:mousepressed(mx, my, mouseButton)
	Button:mousepressed(mx, my, mouseButton)
end

function Credits:draw()
	Button:draw()
end

function Credits:update(dt)
	Button:update(dt)
end

return Credits