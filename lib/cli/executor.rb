# frozen_string_literal: true

require_relative 'base'
require_relative 'file_validator'
require_relative 'processor'
require_relative 'producers/base_output'
require_relative 'producers/totals_output'
require_relative 'producers/uniqs_output'
require_relative 'producers/average_output'

module CLI
  class Executor < Base
    param :file_path
    option :validator, default: proc { CLI::FileValidator }
    option :processor, default: proc { CLI::Processor }
    option :output_producers, default: proc { [CLI::Producers::TotalsOutput, CLI::Producers::UniqsOutput, CLI::Producers::AverageOutput] }

    attr_reader :data

    def call
      validate
      process
      draw_output
    end

    private

    def validate
      validator.call(file_path)
    end

    def process
      @data = processor.call(file_path)
    end

    def draw_output
      output_producers.each do |output_producer|
        output_producer.call(data)
      end
    end
  end
end
