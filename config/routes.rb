Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "session#new"

  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :games, only: [:new, :create, :show, :delete]
    resources :characters
  end

  resources :characters, only: [:show] do
    resources :inventory, only: [:show]
  end

  resources :merchants
  resources :npcs, only: [:show, :index ]

  resources :weapons, only: [:show, :index ]
  resources :armors, only: [:show, :index ]
  resources :potions, only: [:show, :index ]

  get '/boss', to: 'games#boss_battle'
  post '/buy_item', to: 'merchants#buy_item'
  post '/equip_weapon', to: 'characters#equip_weapon'
  post '/equip_armor', to: 'characters#equip_armor'
  post '/use_potion', to: 'games#use_potion'

  post '/update_battle', to: 'games#update_battle'

  match '/auth/:provider/callback', to: 'session#amniauth_create', via: [:get, :post]
  get 'auth/github', :as => 'github_auth'
  get '/scope_test', to: 'users#scope_test'


  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy'
end