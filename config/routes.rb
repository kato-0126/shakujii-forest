Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show,:edit,:update]
  root to: 'contents#index'
  get "contents/about" => "contents#about"
  resources :contents do
    resources :comments, only: :create
  end
end
