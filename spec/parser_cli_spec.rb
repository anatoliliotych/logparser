# frozen_string_literal: true

RSpec.describe ParserCLI do
  let(:file_path) { '/path/to/file' }
  subject { described_class.new.process(file_path) }

  context 'when sucessful flow' do
    before(:each) do
      allow(CLI::Executor).to receive(:call).with(file_path).and_return(nil)
    end

    it { should be nil }
  end

  context 'when errorneous flow' do
    before(:each) do
      allow(CLI::Executor).to receive(:call).with(file_path).and_raise(CLI::InvalidFileError)
    end

    it 'returns error message' do
      expect($stdout).to receive(:puts).with('Command failed with message: Invalid file passed')
      subject
    end
  end
end
