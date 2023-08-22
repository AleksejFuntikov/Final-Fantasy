Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  
  get "profile", to: "profiles#show", as: "profile"

  # get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"

  resources :articles do 
    resources :comments 
  end
end

