local StateManager = {
	states = {},
	modules = {},
	activeState = nil
}

-- Sets the current state
---@param scene string
function StateManager:setState(scene)
	self.activeState = scene
end

-- Gets the current state
function StateManager:getState()
	return self.activeState
end

-- Add a state to state manager
---@param state string
function StateManager:addState(state)
	print("added state: "..state)
	table.insert(self.states, state)
end

-- StateManager will require states/modules and call the load function if possible.
function StateManager:load()
	if #self.states == 0 then error("No states/modules present, use State:addState(\"state\") to add a state") end
	if self.activeState == nil then error("State:setState(\"state\") not set") end
	for _, state in pairs(self.states) do
		self.modules[state] = require(state)
		if self.modules[state].load then
			self.modules[state]:load()
		end
	end
end

--  Events & arguments we want to call.
---@param event string
---@param ... any
function StateManager:call(event, ...)
	local module = self.modules[self.activeState]
	if module[event] then
		module[event](module, ...)
	end
end

return StateManager