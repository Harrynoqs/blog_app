Rails.application.routes.draw do
  get 'users/show'
  get 'posts/show'
 root 'user#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index,  :show] do
    resources :posts, only: [:index, :show]
  end
end
