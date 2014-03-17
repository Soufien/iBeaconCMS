IBeaconCMS::Application.routes.draw do
  resources :detections do
    post 'track'
  end

  resources :users
  match 'users/mobile_user', to: 'users#mobile_user', via: :post

  resources :items

  resources :beacons
  match 'beacons/content', to: 'beacons#content', via: :post


  get 'home/index'
  root :to => 'home#index'

end
