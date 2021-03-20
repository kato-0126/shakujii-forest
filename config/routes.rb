Rails.application.routes.draw do
  devise_for :users
  resources :contents, only:[:index,:new,:create]
  resources :users, only:[:show,:edit,:update]
  root to: 'contents#index'
end
