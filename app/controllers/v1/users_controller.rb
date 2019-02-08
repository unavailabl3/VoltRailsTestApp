class V1::UsersController < ApplicationController
  before_action :authorize_request
  before_action :find_user

  def show
    render json: @user.attributes.except("password_digest"), status: :ok
  end

  def edit
    @user.update_attribute(:photo_url, params[:photo_url])
  end

  private

    def find_user
      @user = User.find_by_email(params[:email])
    end

end
