# frozen_string_literal: true

require_relative '../../../support/shared_examples/shared_example_output_spec'

RSpec.describe CLI::Producers::TotalsOutput do
  include_examples 'a shared output'

  let(:output) do
    <<-OUTPUT.strip.gsub(/^ */, '')
    +-----------------------------------+
    | List of webpages with total views |
    +-----------------+-----------------+
    | Page            | Count           |
    +-----------------+-----------------+
    | /home           | 3 visits        |
    | /about          | 1 visits        |
    +-----------------+-----------------+
    OUTPUT
  end
end
