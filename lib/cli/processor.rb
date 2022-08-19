# frozen_string_literal: true

module CLI
  class Processor < Base
    param :file_path

    def call
      process_file
    end

    private

    def process_file
      File.foreach(file_path) do |line|
        next if line.strip!.empty?

        process_line(line)
      end

      result
    end

    def process_line(line)
      page, visitor_ip = line.split
      result[page] = result[page].tap do |p|
        p[:visits] += 1
        p[:visitors] << visitor_ip
        p[:uniq_visits] = p[:visitors].size
        p[:average] = p[:visits] / p[:uniq_visits].to_f
      end
    end

    def result
      @result ||= Hash.new do |hash, key|
        hash[key] = { visits: 0, visitors: Set.new, uniq_visits: 0, average: 0.0 }
      end
    end
  end
end
