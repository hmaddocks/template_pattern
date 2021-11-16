require_relative "./report"

class HTMLReport < Report
  class << self
    private

      def format = [format_header, format_body, format_footer].join

      def format_header = <<~END
        <!DOCTYPE html>
          <head>
            <title>#{year} Report</title>
          </head>
          <html>
      END

      def format_body = <<~END
        <body>
          #{@data}
        </body>
      END

      def format_footer = <<~END
          <footer>
            #{year} @ Copyright Acme Inc.
          </footer>
        </html>
      END
  end
end