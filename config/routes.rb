Rails.application.routes.draw do
  devise_for :users
  resources :contents, only:[:index,:new]
  root to: 'contents#index'
end
