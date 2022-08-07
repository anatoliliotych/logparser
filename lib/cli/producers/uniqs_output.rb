# frozen_string_literal: true

module CLI
  module Producers
    class UniqsOutput < BaseOutput
      private

      def title
        'List of webpages with uniq views'
      end

      def sort_field
        :uniq_visits
      end

      def field_text
        'uniq views'
      end
    end
  end
end
