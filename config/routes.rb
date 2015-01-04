Rails.application.routes.draw do
  resources :categories

  get '/posts/pending', to: 'posts#pending'
  get '/users/show', to: 'users#show'
  devise_for :users
  resources :posts do
    resources :comments
  end
  get '/about', to: 'pages#about'
  get '/users(/:id)', to: 'users#index', as: 'user_index'
  root 'posts#index'
end
