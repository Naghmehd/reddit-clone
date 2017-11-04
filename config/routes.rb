Rails.application.routes.draw do

  root 'posts#index'

  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'

  get 'login',  to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :comments
  resources :posts

end
