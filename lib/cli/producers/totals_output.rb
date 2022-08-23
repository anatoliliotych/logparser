# frozen_string_literal: true

module CLI
  module Producers
    class TotalsOutput < BaseOutput
      private

      def title
        I18n.t('title.totals')
      end

      def sort_field
        :visits
      end

      def field_text
        I18n.t('field_text.totals')
      end
    end
  end
end
