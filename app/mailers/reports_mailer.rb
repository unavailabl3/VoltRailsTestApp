class ReportsMailer < ApplicationMailer
  default from: 'reports@voltrailsapp.com'

  def report_email
    email = "tranebest@mail.ru"
    @url  = 'http://example.com/login'
    mail(to: email, subject: 'Welcome to My Awesome Site')
    #add to environments config gmail config
    #test mail preview
    #call mailer from reports_controller
  end

end
