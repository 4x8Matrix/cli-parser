local command = require("@self/builders/command")
local cli = require("@self/builders/cli")
local argument = require("@self/builders/argument")
local option = require("@self/builders/option")

export type Command = command.Command
export type CLI = cli.CLI
export type Argument = argument.Argument
export type Option = option.Option

export type CommandContext = command.CommandContext

return {
	argument = argument,
	option = option,
	command = command,
	cli = cli,
}
