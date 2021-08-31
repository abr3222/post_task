# Use this file to easily define all of your cron jobs.

set :environment, "development"
set :output, "cron_log.log"

# every 2.minute do
# runner 'Feedback.generate_xml_report'
# # rake generate_report
# end

# every :day, at: '09:00AM' do
#   runner 'Feedback.generate_xml_report'
# end

every :day, at: '09:00AM' do
  rake generate_report
end