# frozen_string_literal: true

require './lib/parser_cli'

ARGV.unshift(ParserCLI.default_task) unless ParserCLI.all_tasks.key?(ARGV[0])
ParserCLI.start(ARGV)
