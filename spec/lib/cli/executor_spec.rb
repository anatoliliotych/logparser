# frozen_string_literal: true

RSpec.describe CLI::Executor do
  let(:file_path) { '/path/to/file' }
  let(:validator) { double }
  let(:processor) { double }
  let(:producer) { double }

  subject do
    described_class.call(file_path, validator: validator,
                                    processor: processor,
                                    output_producers: [producer])
  end

  it 'executes validator' do
    expect(validator).to receive(:call).with(file_path)
    expect(processor).to receive(:call).with(file_path).and_return([])
    expect(producer).to receive(:call).with([])
    subject
  end
end
