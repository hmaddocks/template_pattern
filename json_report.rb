require "json"
require_relative "./report"

class JSONReport < Report
  class << self
    private
      def format_header = { title: "#{year} Report" }

      def format_body = { data: @data }

      def format_footer = { footer: "#{year} @ Copyright Acme Inc." }

      def format = [format_header, format_body, format_footer]
        .inject({}) { |acc, h| acc.merge(h) }
        .to_json
  end
end