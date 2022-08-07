# frozen_string_literal: true

RSpec.shared_examples 'an object with not implemented method' do
  it 'raises NotImplementedError' do
    expect { subject }.to raise_error(CLI::NotImplementedError)
  end
end

RSpec.describe CLI::Producers::BaseOutput do
  let(:data) { { '/about' => { visits: 1, uniq_visits: 1, visitors: Set.new(['192.168.1.1']) } } }

  subject { klass.call(data) }

  context 'with not defined #title' do
    let(:klass) do
      Class.new(described_class) do
        def sort_field
          :visits
        end

        def field_text; end
      end
    end

    it_behaves_like 'an object with not implemented method'
  end

  context 'with not defined #sort_field' do
    let(:klass) do
      Class.new(described_class) do
        def title; end

        def field_text; end
      end
    end

    it_behaves_like 'an object with not implemented method'
  end

  context 'with not defined #field_text' do
    let(:klass) do
      Class.new(described_class) do
        def title; end

        def sort_field
          :visits
        end
      end
    end

    it_behaves_like 'an object with not implemented method'
  end
end
