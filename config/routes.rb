require "sidekiq/web"

Rails.application.routes.draw do

  api_version(:module => "V1", :path => {:value => "api/v1"}) do
    resources :posts
    resources :users, only: [:show, :edit], param: :email, :format => false, :constraints => { :email => /[^\/]+/ }
    get 'reports/by_author', to: 'reports#generate'
  end

  post 'auth/login', to: 'authentication#login'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest("admin")) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest("admin"))
  end #if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"

end
