IBeaconCMS::Application.routes.draw do

  resources :templates

  resources :beacon_devices
  match 'beacon_devices/add_device_to_beacon_range', to: 'beacon_devices#add_device_to_beacon_range', via: :post
  match 'beacon_devices/remove_device_from_beacon_range', to: 'beacon_devices#remove_device_from_beacon_range', via: :post

  resources :notifications
  match 'notifications/broadcast_notification', to: 'notifications#broadcast_notification', via: :post

  resources :apps

  devise_for :users
  resources :detections do
    post 'track'
  end

  resources :users
  match 'users/mobile_user', to: 'users#mobile_user', via: :post

  resources :items do
    member do
      get 'embedded'
      get 'kiosk'
    end
  end

  resources :beacons
  match 'beacons/content', to: 'beacons#content', via: :post


  get 'home/index'
  root :to => 'home#index'

end
