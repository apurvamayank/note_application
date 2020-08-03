# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => Rails.application.credentials.sendgrid[:username],
  :password       => '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',
  :domain         => 'noteapp.com',
  :enable_starttls_auto => true
}