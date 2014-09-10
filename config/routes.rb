IBeaconCMS::Application.routes.draw do

  resources :template_wines
  match 'template_wines/new', to: 'template_wines#new', via: :post
  match 'template_wines/:id/edit', to: 'template_wines#edit', via: :post


  resources :template_photos

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
      get 'template'
    end
  end

  resources :items
  match 'items/new', to:'items#new', via: :post
  match 'items/:id/edit', to:'items#edit', via: :post

  resources :beacons
  match 'beacons/content', to: 'beacons#content', via: :post
  match 'beacons/new', to: 'beacons#new', via: :post
  match 'beacons/:id/edit', to: 'beacons#edit', via: :post

  get 'home/index'
  root :to => 'home#index'

end
