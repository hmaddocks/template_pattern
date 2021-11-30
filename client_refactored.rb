require "date"
require "json"

class Report
  class << self
    def call
      yield header, footer
    end

    private

    def header = "#{year} Report"
    def footer = "#{year} @ Copyright Acme Inc."
    def spacer = "#{'-' * 72}"
    def year = Date.today.year.to_s
  end
end

data = "This is some data I want to put in my report"

html = Report.call do |header, footer|
  <<~HTML
    <!DOCTYPE html>
    <head><title>#{header}</title></head>
    <html>
      <body>#{data}</body>
      <footer>#{footer}</footer>
    </html>
  HTML
end

json = Report.call do |header, footer|
  { title: header, body: data, footer: footer }.to_json
end

txt = Report.call do |header, footer|
  <<~END
    #{header}
    "#{'-' * 72}"
    #{data}
    "#{'-' * 72}"
    #{footer}
  END
end

puts html
puts json
puts txt
