Rails.application.routes.draw do
  devise_for :users
  resources :contents
  resources :users, only:[:show,:edit,:update]
  root to: 'contents#index'
end
