local Game = {}
Game.__index = Game

function Game.new(settings)
	local instance = setmetatable({}, Game)
	instance.x      = settings.x or 0
	instance.y      = settings.y or 0
	instance.w      = settings.w or 100
	instance.h      = settings.h or 50
	return instance
end

function Game:update(dt)

end

function Game:draw()
	love.graphics.rectangle("fill",0,0,50,50)
end

return Game