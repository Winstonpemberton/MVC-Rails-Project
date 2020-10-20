Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "session#new"

  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :games, only: [:new, :create, :show, :delete]
    resources :characters
  end

  get '/battle', to: 'game#battle'

  resources :characters, only: [:show] do
    resources :weapons, only: [:show, :index ]
    resources :armors, only: [:show, :index ]
    resources :potions, only: [:show, :index ]
    resources :inventory, only: [:show]
  end

  resources :merchants, only: [:show] do
    resources :weapons, only: [:show, :index ]
    resources :armors, only: [:show, :index ]
    resources :potions, only: [:show, :index ]
  end

  get '/character_info', to: 'character#character_info'
  get '/boss', to: 'game#boss_battle'

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy'
end
