# frozen_string_literal: true

require 'thor'
require 'i18n'
require_relative 'cli/errors'
require_relative 'cli/executor'
I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]

class ParserCLI < Thor
  desc '<file path>, <locale>', 'processes log file'
  def process(file_path, locale = :en)
    I18n.default_locale = locale.to_sym

    CLI::Executor.call(file_path)
  rescue CLI::Error => e
    puts "#{I18n.t(:error)} #{e.message}"
  end

  default_task :process

  def self.exit_on_failure?
    true
  end
end
