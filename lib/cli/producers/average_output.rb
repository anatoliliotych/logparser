module CLI
  module Producers
    class AverageOutput < BaseOutput
      private

      def title
        'List of webpages with average views'
      end

      def sort_field
        :average
      end

      def sort_direction
        1
      end

      def field_text
        'visits'
      end
    end
  end
end
