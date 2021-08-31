require "./app"
require "sinatra/activerecord/rake"
Dir.glob('lib/tasks/*.rake').each { |r| load r}

task :generate_report do
  Feedback.generate_xml_report
end