class V1::ReportsController < ApplicationController
  before_action :json_format
  #before_action :authorize_request
  before_action :find_user

  def generate
    needed_params
    #render json: params, status: :ok
    @posts_amount = @user.posts.where(published_at: params[:start_date]..params[:end_date]).count
    @comments_amount = Comment.where(author: 'example', published_at: params[:start_date]..params[:end_date]).count
    #render json: { posts: @posts_amount, comments: @comments_amount}, status: :ok
    render json: { message: "Report generation started. It will be sent to #{params[:email]}" }, status: :ok
  end

  private

    def find_user
      @user = User.find_by_nickname(params[:nickname])
    end

    def json_format
      render plain: "Wrong format" unless params[:format] == 'json'
    end

    def needed_params
      params.require(:start_date)
      params.require(:end_date)
      params.require(:email)
    end

end
