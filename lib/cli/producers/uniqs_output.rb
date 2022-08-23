# frozen_string_literal: true

module CLI
  module Producers
    class UniqsOutput < BaseOutput
      private

      def title
        I18n.t('title.uniq')
      end

      def sort_field
        :uniq_visits
      end

      def field_text
        I18n.t('field_text.uniq')
      end
    end
  end
end
