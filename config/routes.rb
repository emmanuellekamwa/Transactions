Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/transactions/no-grp', to: 'transactions#no_grp'
  resources :users, only: %i[create show]
  resources :groups, only: %i[index show new create]
  resources :transactions, only: %i[index show new create]
  root 'static#home'
end