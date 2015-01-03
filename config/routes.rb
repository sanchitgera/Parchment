Rails.application.routes.draw do
  get '/posts/pending', to: 'posts#pending'
  get '/users/show', to: 'users#show'
  get '/users(/:id)', to: 'users#index', as: 'user_index'
  devise_for :users
  resources :posts do
    resources :comments
  end
  get '/about', to: 'pages#about'
  root 'posts#index'
end
