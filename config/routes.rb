Rails.application.routes.draw do
  api_version(:module => "V1", :path => {:value => "api/v1"}) do
    resources :posts
  end
end
