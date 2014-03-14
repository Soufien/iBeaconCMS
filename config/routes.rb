IBeaconCMS::Application.routes.draw do
  resources :detections do
    post 'track'
  end

  resources :users

  resources :items

  get "home/index"
  resources :beacons

  root :to => 'home#index'

end
