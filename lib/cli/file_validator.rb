# frozen_string_literal: true

module CLI
  class FileValidator < Base
    param :file_path

    def call
      raise InvalidFileError unless File.file?(file_path)
      raise EmptyFileError if File.zero?(file_path)

      true
    end
  end
end
