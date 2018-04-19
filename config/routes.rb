Rails.application.routes.draw do
  resources :users, only: %i[new create show edit update], shallow: true
  resources :recipes
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
