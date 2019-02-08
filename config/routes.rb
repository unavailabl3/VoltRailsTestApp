Rails.application.routes.draw do

  api_version(:module => "V1", :path => {:value => "api/v1"}) do
    resources :posts
    resources :users, only: [:show, :edit], param: :email, :format => false, :constraints => { :email => /[^\/]+/ }
    get 'reports/by_:nickname', to: 'reports#generate', param: :nickname
  end

  post 'auth/login', to: 'authentication#login'

end
