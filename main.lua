StateManager = require("statemanager")
require("globals")

function love.load()
	StateManager:addState("game")
	StateManager:addState("mainmenu")
	StateManager:setState("mainmenu")
	StateManager:load()
end

function love.keypressed(key, scancode, isrepeat)
	StateManager:call("keypressed", key, scancode, isrepeat)
end

function love.mousepressed(x, y, button, isTouch)
	StateManager:call("mousepressed", x, y, button, isTouch)
end

function love.mousemoved(x, y, dx, dy)

end

function love.update(dt)
	StateManager:call("update", dt)
end

function love.draw()
	StateManager:call("draw")
end