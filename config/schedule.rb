# Use this file to easily define all of your cron jobs.

set :environment, "development"
set :output, "cron_log.log"

every 2.minute do
runner 'Feedback.generate_xml_report'
# rake generate_report
end


#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"



# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
#

# Learn more: http://github.com/javan/whenever
