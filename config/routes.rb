Rails.application.routes.draw do
  scope module: :devise do
    devise_for :admins, :controller => {
      :sessions => "devise/admins/sessions",
      :registrations => "devise/admins/registrations"
    }
    devise_for :users, :controller => {
      :sessions => "devise/users/sessions",
      :registrations => "devise/users/registrations"
    }
  end

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
