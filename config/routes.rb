Rails.application.routes.draw do
  get '/posts/pending', to: 'posts#pending'
  get '/users/show', to: 'users#show'
  devise_for :users
  resources :posts do
    resources :comments
  end
  get '/about', to: 'pages#about'
  root 'posts#index'
end
