Rails.application.routes.draw do
  devise_for :users
  root to:  "asks#index"
  resources :asks do
   resources :comments, only:[:create]
  collection do
    get 'search'
  end
end
  # resources :comments, only:[:destroy]
  resources :users, only:[:show,:index]
end
