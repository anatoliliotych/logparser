# frozen_string_literal: true

require_relative '../../../support/shared_examples/shared_example_output_spec'

RSpec.describe CLI::Producers::UniqsOutput do
  include_examples 'a shared output'

  let(:output) do
    <<-OUTPUT.strip.gsub(/^ */, '')
    +----------------------------------+
    | List of webpages with uniq views |
    +-----------------+----------------+
    | Page            | Count          |
    +-----------------+----------------+
    | /home           | 2 uniq views   |
    | /about          | 1 uniq views   |
    +-----------------+----------------+
    OUTPUT
  end
end
