Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :new, :create, :edit, :update, :delete] do
    resources :games, only: [:new, :create, :delete]
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

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/logout', to: 'session#destroy'
end
