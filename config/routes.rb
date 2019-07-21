Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  scope module: :users do
    resource :users
    resources :items
    resources :cart_items
    resources :orders
    resources :addresses
  end

  namespace :admins do
    resources :users
    resources :items
    resources :orders
    resources :labels
    resources :artists
    resources :genres
    resources :addresses
  end

end
