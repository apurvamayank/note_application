class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@noteapp.com'
  layout 'mailer'
end
