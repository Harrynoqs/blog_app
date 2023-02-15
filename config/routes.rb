Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: "home#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create]
    end
  resources :posts do 
    resources :likes, only: [:create]
  end
end
end