Rails.application.routes.draw do
  namespace :admin do
    resources :recipes, only: %i[edit update destroy] do
      resources :recipe_ingredients, only: %i[edit update destroy]
    end
  end

  resources :recipes, only: %i[new create index show] do
    resources :recipe_ingredients, only: %i[new create]
  end

  resources :users, only: %i[new create show edit update], shallow: true
  resources :ingredients, only: %i[new create]
  resources :user_recipes, only: %i[create destroy]
  resources :user_grocery_lists, only: %i[create]

  root 'welcome#index'
  get '/dashboard', to: 'dashboard#index'
  get '/basket', to: 'basket#show'
  post '/basket', to: 'basket#create'
  patch '/basket', to: 'basket#update'
  post '/basket', to: 'basket#update'
  delete '/basket', to: 'basket#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/search', to: 'search#index'
end
