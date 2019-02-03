class V1::PostsController < ApplicationController
  before_action :json_format
  before_action :authorize_request
  before_action :find_user

  def index
    posts = []
    Post.paginate(page: params[:page], per_page: params[:per_page]).order('published_at DESC').each{ |post|
      posts << post
    }
    render json: posts, status: :ok
  end

  def create
    create_params = {
      :title => params[:title],
      :body => params[:body],
      :published_at => params[:published_at],
      :author => @current_user[:nickname]
    }
    create_params[:published_at] = Time.now if params[:published_at].nil?

    @post = @current_user.posts.new(create_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: {:errors => @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    post = Post.find(params[:id])
    render json: post, status: :ok
  end

  private

    def find_user
      @user = User.find_by_email(params[:email])
    end

    def json_format
      render plain: "Not found" unless params[:format] == 'json'
    end

end
