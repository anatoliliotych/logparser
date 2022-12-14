# frozen_string_literal: true

require 'terminal-table'

module CLI
  module Producers
    class BaseOutput < Base
      param :data, default: proc { [] }

      def call
        puts table.render
      end

      private

      def table
        Terminal::Table.new do |config|
          config.title = title
          config.headings = headings
          config.rows = rows
        end
      end

      def rows
        sorted_rows.map { |page, values| [page, "#{values[sort_field]} #{field_text}"] }
      end

      def sorted_rows
        data.sort_by { |_page, values| sort_direction * values[sort_field] }
      end

      def headings
        [I18n.t('header.page'), I18n.t('header.count')]
      end

      def sort_direction
        -1
      end

      def sort_field
        raise NotImplementedError
      end

      def title
        raise NotImplementedError
      end

      def field_text
        raise NotImplementedError
      end
    end
  end
end
