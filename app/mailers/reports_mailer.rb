class ReportsMailer < ApplicationMailer
  default from: 'reports@voltrailsapp.com'

  def report_email(records: nil, email_to: nil, from: nil, to: nil)
    @report = { records: records, from: from, to: to }
    mail(to: email_to, subject: 'Generated report')
  end

end
