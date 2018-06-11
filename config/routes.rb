Rails.application.routes.draw do
  namespace :admin do
    resources :recipes, only: %i[edit update destroy] do
      resources :recipe_ingredients, only: %i[edit update]
    end
  end

  resources :recipes, only: %i[edit update new create index show] do
    resources :recipe_ingredients, only: %i[new create destroy]
  end

  resources :users, only: %i[new create show edit update], shallow: true
  resources :ingredients, only: %i[new create]
  resources :user_recipes, only: %i[create destroy]
  resources :grocery_lists, only: %i[index new create show]
  resources :conversion, only: %i[create]
  resources :purchase, only: %i[create]

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
  get '/search/:id', to: 'search#show'
  get '/auth/amazon', as: :amazon_login
  get '/auth/amazon/callback', to: 'oauth#create'

  namespace :api do
    namespace :v1 do
      get '/grocery_lists/:id', to: 'grocery_lists#show'
    end
  end
end
