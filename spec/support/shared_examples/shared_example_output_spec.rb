# frozen_string_literal: true

RSpec.shared_examples 'a shared output' do
  let(:data) do
    {
      '/home' => { visits: 3, uniq_visits: 2, visitors: Set.new(['127.0.0.1', '192.168.1.1']), average: 1.5 },
      '/about' => { visits: 1, uniq_visits: 1, visitors: Set.new(['192.168.1.1']), average: 1.0 }
    }
  end

  subject { described_class.call(data) }

  it 'prints correct output' do
    expect($stdout).to receive(:puts).with(output)
    subject
  end
end
