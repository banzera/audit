# config/initializers/delayed_job_config.rb
Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 10
Delayed::Worker.sleep_delay = 10 if Rails.env.development?
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 5.minutes
Delayed::Worker.read_ahead = 10
Delayed::Worker.default_queue_name = 'default'
Delayed::Worker.delay_jobs = !Rails.env.test?
Delayed::Worker.raise_signal_exceptions = :term
Delayed::Worker.logger = Logger.new(Rails.root.join('log', 'delayed_job.log'))
Delayed::Worker.logger = Rails.logger if Rails.env.production?
