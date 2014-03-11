IBeaconCMS::Application.routes.draw do
  resources :items

  get "home/index"
  resources :beacons

  root :to => 'home#index'

end
