IBeaconCMS::Application.routes.draw do
  resources :users

  resources :items

  get "home/index"
  resources :beacons

  root :to => 'home#index'

end
