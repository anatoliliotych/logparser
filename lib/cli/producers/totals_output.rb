# frozen_string_literal: true

module CLI
  module Producers
    class TotalsOutput < BaseOutput
      private

      def title
        'List of webpages with total views'
      end

      def sort_field
        :visits
      end

      def field_text
        'visits'
      end
    end
  end
end
