Rails.application.routes.draw do
 root 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index,  :show] do
    resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create, :new]
    end
  resources :posts do 
    resources :likes, only: [:create]
  end
end
end
