IBeaconCMS::Application.routes.draw do
  get "home/index"
  resources :beacons

  root :to => 'home#index'

end
