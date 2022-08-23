# frozen_string_literal: true

RSpec.describe ParserCLI do
  let(:file_path) { '/path/to/file' }
  let(:locale) { 'fr' }
  subject { described_class.new.process(file_path, locale) }

  context 'when sucessful flow' do
    before(:each) do
      allow(CLI::Executor).to receive(:call).with(file_path).and_return(nil)
    end

    it { should be nil }

    it "sets locale" do
      expect(I18n).to receive('default_locale=').with(:fr)
      subject
    end
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
