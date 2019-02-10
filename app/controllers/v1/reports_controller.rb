class V1::ReportsController < ApplicationController
  before_action :json_format
  before_action :authorize_request

  def generate
    needed_params
    records = []
    User.find_each do |user|
      posts_amount = user.posts.where(published_at: params[:start_date]..params[:end_date]).count
      comments_amount = Comment.where(author: user.nickname, published_at: params[:start_date]..params[:end_date]).count
      records << {user: user, posts_amount: posts_amount, comments_amount: comments_amount}
    end
    records.sort_by! {|record| (record[:posts_amount]+record[:comments_amount])/10 }
    ReportsMailer.report_email( records: records, email_to: params[:email], from: params[:start_date], to: params[:end_date] ).deliver_now
    render json: { message: "Report generation started. It will be sent to #{params[:email]}" }, status: :ok
  end

  private

    def json_format
      render plain: "Wrong format" unless params[:format] == 'json'
    end

    def needed_params
      params.require(:start_date)
      params.require(:end_date)
      params.require(:email)
    end

end
