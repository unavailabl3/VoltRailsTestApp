class ReportWorker
  include Sidekiq::Worker

  def perform(email_to, start_date, end_date)
    records = []
    User.find_each do |user|
      posts_amount = user.posts.where(published_at: start_date..end_date).count
      comments_amount = Comment.where(author: user.nickname, published_at: start_date..end_date).count
      records << {user: user, posts_amount: posts_amount, comments_amount: comments_amount}
    end
    records.sort_by! {|record| (record[:posts_amount]+record[:comments_amount])/10 }
    ReportsMailer.report_email( records: records, email_to: email_to, from: start_date, to: end_date ).deliver_now
  end
end
