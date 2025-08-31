local process = require("@lune/process")

local cliBuilder = require("../src")

local CLI = cliBuilder.cli
local option = cliBuilder.option
local command = cliBuilder.command
local argument = cliBuilder.argument

CLI.new()
	:setName("pixelcove")
	:setDescription("A powerful command-line tool for managing game assets.")
	:setVersion("2.1.0")
	:addCommand(command
		.new()
		:setName("export")
		:setDescription("Export assets for a build.")
		:setCallback(function(context)
			print("Exporting assets...")
		end)
		:build())
	:run(process.args)
