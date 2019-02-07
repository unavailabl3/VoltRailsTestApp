Rails.application.routes.draw do

  api_version(:module => "V1", :path => {:value => "api/v1"}) do
    resources :posts
    resources :users, only: :show, param: :email, :format => false, :constraints => { :email => /[^\/]+/ }
  end

  post 'auth/login', to: 'authentication#login'

end
