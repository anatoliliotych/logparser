# frozen_string_literal: true

require 'thor'
require_relative 'cli/errors'
require_relative 'cli/executor'

class ParserCLI < Thor
  desc '<file path>', 'processes log file'
  def process(file_path)
    CLI::Executor.call(file_path)
  rescue CLI::Error => e
    puts "Command failed with message: #{e.message}"
  end

  default_task :process

  def self.exit_on_failure?
    true
  end
end
