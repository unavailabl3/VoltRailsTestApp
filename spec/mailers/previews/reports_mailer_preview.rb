# Preview all emails at http://localhost:3000/rails/mailers/reports_mailer
class ReportsMailerPreview < ActionMailer::Preview
  def report_email
    ReportsMailer.report_email
  end
end
