local Command = require("../builders/command")
local Argument = require("../builders/argument")

local function intoType(arg, type: Argument.ArgumentTypeString): any
	if type == "number" then
		return tonumber(arg)
	else
		return tostring(arg)
	end
end

return function(command: Command.Command, args: { string })
	local parsedArgs = {}
	local argDefinitions = command.arguments

	for i, argumentDefinition in argDefinitions do
		local value = args[i]

		if value ~= nil then
			parsedArgs[argumentDefinition.name] = intoType(value, argumentDefinition.type)
		elseif argumentDefinition.required then
			error(`Missing required argument for command '{command.name}': '{argumentDefinition.name}'`)
		end
	end

	if #args > #argDefinitions then
		local unexpectedArg = args[#argDefinitions + 1]

		print(`Received unexpected argument '{unexpectedArg}' for command '{command.name}'.`)
	end

	return parsedArgs
end
