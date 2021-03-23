Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show,:edit,:update]
  root to: 'contents#index'
  resources :contents do
    resources :comments, only: :create
  end
end
