Rails.application.routes.draw do
  resources :categories

  get '/posts/pending', to: 'posts#pending'
  get '/users/show', to: 'users#show'
  post '/users/promote/:id', to: 'users#promote', as: 'user_promote'
  devise_for :users
  resources :posts do
    resources :comments
  end
  get '/about', to: 'pages#about'
  get '/users(/:id)', to: 'users#index', as: 'user_index'
  root 'posts#index'
end
