class V1::UsersController < ApplicationController
  #before_action :json_format
  before_action :authorize_request
  before_action :find_user

  def show
    render json: @user.attributes.except("password_digest"), status: :ok
  end

  private

    def find_user
      @user = User.find_by_email(params[:email])
    end

    def json_format
      render plain: "Not found" unless params[:format] == 'json'
    end

end
