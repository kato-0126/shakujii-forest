Rails.application.routes.draw do
  devise_for :users
  resources :contents, only:[:index,:new]
  resources :users,only: :show
  root to: 'contents#index'
end
