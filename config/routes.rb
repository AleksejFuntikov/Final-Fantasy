Rails.application.routes.draw do
  get 'dashboard/show'
  get 'dashboard/edit'
  get 'dashboard/update'
  devise_for :users
  root "articles#index"

  # get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"

  resources :articles do 
    resources :comments 
  end
end

