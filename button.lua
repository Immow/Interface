local Button = {}
Button.__index = Button

local buttons = {}

---@class buttons
---@param settings {x:integer, y:integer, w:integer, h:integer, text:string, hover:boolean, state:string, fn:function, align:string, offsetY:integer}
function Button.new(settings)
	local instance = setmetatable({}, Button)
	instance.x      = settings.x or 0
	instance.y      = settings.y or 0
	instance.w      = settings.w or 200
	instance.h      = settings.h or 75
	instance.text   = settings.text or "myButton"
	instance.hover  = false
	instance.state  = settings.state
	instance.fn     = settings.fn or function () print(instance.text) end
	instance.offsetY = settings.offsetY or 0

	if not buttons[instance.state] then
		buttons[instance.state] = {}
	end

	table.insert(buttons[instance.state], instance)

	if settings.align == "center" then
		Button:alignCenter(settings.state)
	end

	return instance
end

function Button:alignCenter(state)
	local buttonCombinedHeight = 0
	for i = 1, #buttons[state] do
		local b = buttons[state][i]
		buttonCombinedHeight = buttonCombinedHeight + b.h + b.offsetY
	end

	for i = 1, #buttons[state] do
		local b = buttons[state][i]
		local start = WH / 2 - (buttonCombinedHeight / 2)
		b.y = start + ((b.h + b.offsetY) * (i-1))
		b.x = WW / 2 - b.w / 2
	end
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