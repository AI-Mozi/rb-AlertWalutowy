require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load if %w[development test].include?(ENV['RAILS_ENV'])

module AlertWalutowy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(5.2)

    config.serve_static_files = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end

  Sentry.init do |config|
    config.dsn = 'https://ea6b8b1c9f714d1fa3fbe78ad29dca2b@o526871.ingest.sentry.io/5642438'
    config.breadcrumbs_logger = [:active_support_logger]

    # To activate performance monitoring, set one of these options.
    # We recommend adjusting the value in production:
    config.traces_sample_rate = 0.5
    # or
    config.traces_sampler =
      lambda do |_context|
        true
      end
  end
end
