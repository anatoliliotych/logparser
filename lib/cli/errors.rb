# frozen_string_literal: true

module CLI
  class Error < StandardError
  end

  class InvalidFileError < Error
    def initialize
      super('Invalid file passed')
    end
  end

  class EmptyFileError < Error
    def initialize
      super('Empty file passed')
    end
  end

  class NotImplementedError < Error
    def initialize
      super('Method is not implemented')
    end
  end
end
