require_relative "./report"
require_relative "./txt_report"
require_relative "./html_report"
require_relative "./json_report"

data = "This is some data I want to put in my report"

# puts TXTReport.call(data)
# puts HTMLReport.call(data)
puts JSONReport.call(data)
