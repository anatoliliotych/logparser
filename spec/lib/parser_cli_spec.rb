# frozen_string_literal: true

RSpec.describe ParserCLI do
  let(:parser_cli) { described_class }
  let(:args) { ['process', '/path/to/log_file'] }

  describe '#process' do
    subject { parser_cli.start(args) }

    it 'evokes LogHandler class method with proper params' do
      expect(CLI::Executor).to receive(:call).with(args.last)
      subject
    end
  end
end
