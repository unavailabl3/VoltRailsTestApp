class V1::PostsController < ApplicationController
  before_action :user_authenticate
  before_action :json_format

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

    def user_authenticate
      @current_user = User.first
    end

    def json_format
      respond_to :json
    end

end
