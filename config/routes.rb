IBeaconCMS::Application.routes.draw do
  resources :detections do
    post 'track'
  end

  resources :users
  match 'users/mobile_user', to: 'users#mobile_user', via: :post

  resources :items

  get 'home/index'
  resources :beacons

  root :to => 'home#index'

end
