# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.default_url_options = { host: 'pacific-castle-09551.herokuapp.com'}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: 587,
  domain: 'pacific-castle-09551.herokuapp.com',
  user_name: 'apikey',
  password: ENV['SENDGRID_API_KEY'],
  authentcation: 'plain',
  enable_starttls_auto: true
}