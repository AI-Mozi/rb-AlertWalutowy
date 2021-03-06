Redis.exists_returns_integer = false

schedule_file = 'config/schedule.yml'

Sidekiq::Cron::Job.load_from_hash(YAML.load_file(schedule_file)) if File.exist?(schedule_file) && Sidekiq.server?


Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379' }
end