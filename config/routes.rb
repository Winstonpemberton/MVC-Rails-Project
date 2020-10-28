Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "session#new"

  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :games, only: [:new, :create, :show, :delete]
    resources :characters
  end

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

  get '/boss', to: 'games#boss_battle'
  
  post '/buy_item', to: 'merchants#buy_item'
  post '/equip_weapon', to: 'characters#equip_weapon'
  post '/equip_armor', to: 'characters#equip_armor'

  post '/update_battle', to: 'games#update_battle'

  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy'
end
