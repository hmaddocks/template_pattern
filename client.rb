require "date"
require "json"

class Report
  class << self
    def call(data, format: nil)
      case format
      when :html
        <<~HTML
          <!DOCTYPE html>
          <head><title>#{header}</title></head>
          <html>
            <body>#{data}</body>
            <footer>#{footer}</footer>
          </html>
        HTML
      when :json
        { title: header, body: data, footer: footer }.to_json
      else
        <<~END
          #{header}
          #{spacer}
          #{data}
          #{spacer}
          #{footer}
        END
      end
    end

    private

      def header = "#{year} Report"
      def footer = "#{year} @ Copyright Acme Inc."
      def spacer = "#{'-' * 72}"
      def year = Date.today.year.to_s
  end
end

data = "This is some data I want to put in my report"

puts Report.call(data, format: :json)