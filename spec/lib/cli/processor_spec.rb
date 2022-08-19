# frozen_string_literal: true

require 'tempfile'

RSpec.describe CLI::Processor do
  let(:file_path) { 'file.log' }
  let(:file) do
    Tempfile.new(file_path).tap do |f|
      f << content
      f.close
    end
  end

  let(:expected_result) do
    {
      '/home' => { visits: 3, uniq_visits: 2, visitors: Set.new(['127.0.0.1', '192.168.1.1']), average: 1.5 },
      '/about' => { visits: 1, uniq_visits: 1, visitors: Set.new(['192.168.1.1']), average: 1 }
    }
  end

  subject { described_class.call(file.path) }

  context 'when valid log file' do
    let(:content) do
      <<-LOGFILE
      /home 127.0.0.1
      /home 127.0.0.1
      /about 192.168.1.1
      /home 192.168.1.1
      LOGFILE
    end

    it 'returns correct result' do
      expect(subject).to eq(expected_result)
    end
  end

  context 'when log file with empty lines' do
    let(:content) do
      <<-LOGFILE
      /home 127.0.0.1

      /home 127.0.0.1

      /about 192.168.1.1

      /home 192.168.1.1
      LOGFILE
    end

    it 'returns correct result' do
      expect(subject).to eq(expected_result)
    end
  end
end
