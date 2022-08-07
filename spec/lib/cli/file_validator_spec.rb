# frozen_string_literal: true

RSpec.describe CLI::FileValidator do
  subject { described_class.call(path) }

  context 'with valid path' do
    let(:path) { 'spec/files/webserver.log' }

    it { should be true }
  end

  context 'with invalid path' do
    let(:path) { 'spec/files/fake.log' }

    it 'raises error' do
      expect { subject }.to raise_error(CLI::InvalidFileError)
    end
  end

  context 'with empty file' do
    let(:path) { 'spec/files/empty.log' }

    it 'raises error' do
      expect { subject }.to raise_error(CLI::EmptyFileError)
    end
  end
end
