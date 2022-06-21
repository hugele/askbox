Rails.application.routes.draw do
  devise_for :users
  root to:  "asks#index"
  resources :asks do
   resources :comments, only:[:index, :new, :create, :destroy, :edit, :update]
  collection do
    get 'search'
  end
end
  resources :users, only: :show
  resources :deletes, only: :index
end
