# set :output, "app/jobs/logs/subscription_expiry.log"
#
# every 1.minute do
#   runner "app/jobs/subscription_expiry.rb"
# end
#
# set :output, "app/jobs/logs/server_settings_job.log"
# every 60.minute do
#   runner "app/jobs/server_settings.rb" , environment => "development"
# end
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
