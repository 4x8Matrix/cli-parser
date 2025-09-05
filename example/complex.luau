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
	:setGitRepository("https://github.com/example/pixelcove")
	:setBugReportUrl("https://github.com/example/pixelcove/issues")
	:setHomepage("https://pixelcove.dev")
	:setCopyright("Copyright (c) 2025 Example Inc.")
	:setEpilog("Example: pixelcove import --type=sprite 'player.png'")
	:addAuthor("Jane Doe <jane@example.com>")
	:setLicense("MIT")
	:addOption(
		option
			.new()
			:setName("verbose")
			:setType("boolean")
			:setDescription("Enable verbose logging for all commands.")
			:build()
	)
	:addOption(
		option
			.new()
			:setName("project")
			:setType("string")
			:setValueName("PATH")
			:setDescription("Set the path to the project file.")
			:build()
	)
	:addCommand(command
		.new()
		:setName("import")
		:setDescription("Import a new asset into the project.")
		:setCallback(function(context)
			print("Importing asset...")
			print("Context:", context.commandOptions)
		end)
		:addArgument(
			argument
				.new()
				:setName("source")
				:setDescription("The path to the source asset file.")
				:setRequired(true)
				:setType("string")
				:build()
		)
		:addArgument(
			argument
				.new()
				:setName("destination")
				:setDescription("The new name for the asset in the project.")
				:setRequired(false)
				:setType("string")
				:build()
		)
		:addOption(
			option
				.new()
				:setName("type")
				:setType("string")
				:setDescription("The type of asset to import (e.g., sprite, sound).")
				:build()
		)
		:addOption(
			option.new():setName("compress"):setType("boolean"):setDescription("Enable asset compression."):build()
		)
		:addSubCommand(command
			.new()
			:setName("batch")
			:setDescription("Import multiple assets from a directory.")
			:setCallback(function(context)
				print("Batch importing assets...")
				print("Context:", context)
			end)
			:build())
		:build())
	:addCommand(command
		.new()
		:setName("export")
		:setDescription("Export assets for a build.")
		:setCallback(function(context)
			print("Exporting assets...")
		end)
		:build())
	:addCommand(command
		.new()
		:setName("list")
		:setDescription("List all assets in the project.")
		:setCallback(function(context)
			print("Listing assets...")
		end)
		:build())
	:configure({
		ansiColorEnabled = true,
	})
	:run(process.args)
