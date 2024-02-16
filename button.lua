local Button = {}
Button.__index = Button

-- Create a new button
---@class buttons
---@field x number x position
---@field y number y position
---@field w number width
---@field h number height
---@field fn function function we run on button release

local buttons = {}
function Button.new(settings)
	local instance = setmetatable({}, Button)
	instance.x      = settings.x or 0
	instance.y      = settings.y or 0
	instance.w  = settings.w or 200
	instance.h = settings.h or 75
	instance.text   = settings.text or "myButton"
	instance.hover  = false
	instance.state  = settings.state
	instance.fn     = settings.fn or function () print(instance.text) end

	if not buttons[instance.state] then -- might refactor this
		buttons[instance.state] = {}
	end

	table.insert(buttons[instance.state], instance) -- do we really wanna store buttons in our class?

	return instance
end

function Button:isMouseOnButton(mx, my)
	local xRegion = self.x <= mx and self.x + self.w >= mx
	local yRegion = self.y <= my and self.y + self.h >= my
	return xRegion and yRegion
end

function Button:mousepressed(mx,my,mouseButton)
	if mouseButton ~= 1 then return end
	for _, button in ipairs(buttons[StateManager:getState()]) do
		local hovered = button:isMouseOnButton(mx, my)
		if hovered then
			button.fn()
		end
	end
end

function Button:draw()
	for _, button in ipairs(buttons[StateManager:getState()]) do
		if button.hover then
			love.graphics.setColor(1,0,0)
		else
			love.graphics.setColor(1,1,1)
		end
		love.graphics.rectangle("line", button.x, button.y, button.w, button.h)
		love.graphics.print(button.text, button.x, button.y)
	end
end

function Button:update(dt)
	local mx, my = love.mouse.getPosition()
	for _, button in ipairs(buttons[StateManager:getState()]) do
		if button:isMouseOnButton(mx, my) then
			button.hover = true
		else
			button.hover = false
		end
	end
end

return Button