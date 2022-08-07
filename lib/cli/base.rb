# frozen_string_literal: true

require 'dry-initializer'
require_relative 'errors'

module CLI
  class Base
    extend Dry::Initializer

    def self.call(*args)
      new(*args).call
    end
  end
end
