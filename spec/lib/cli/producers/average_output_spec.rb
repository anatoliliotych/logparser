# frozen_string_literal: true

require_relative '../../../support/shared_examples/shared_example_output_spec'

RSpec.describe CLI::Producers::AverageOutput do
  include_examples 'a shared output'

  let(:output) do
    <<-OUTPUT.strip.gsub(/^ */, '')
    +-------------------------------------+
    | List of webpages with average views |
    +------------------+------------------+
    | Page             | Count            |
    +------------------+------------------+
    | /about           | 1.0 visits       |
    | /home            | 1.5 visits       |
    +------------------+------------------+
    OUTPUT
  end
end
