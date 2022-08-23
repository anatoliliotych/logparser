module CLI
  module Producers
    class AverageOutput < BaseOutput
      private

      def title
        I18n.t('title.average')
      end

      def sort_field
        :average
      end

      def sort_direction
        1
      end

      def field_text
        I18n.t('field_text.average')
      end
    end
  end
end
