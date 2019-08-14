Rails.application.routes.draw do
  scope module: :users do
    root 'items#index'
    resource :users, only: [:show, :edit, :update] do
      collection do
        get :unsubscribe_confirm
        get :unsubscribe
      end
    end
    resources :items, only: [:index, :show]
    resources :cart_items
    resources :orders, only: [:index, :new, :create] do
      collection do
        get :completion
      end
    end
    resources :addresses
  end

  namespace :admins do
    root 'items#index'
    resources :users
    resources :items
    resources :orders
    resources :labels
    resources :artists
    resources :genres
    resources :addresses
  end

  devise_for :admins, :controllers => {
      :sessions => "devise/admins/sessions",
      :registrations => "devise/admins/registrations"
    }
    devise_for :users, :controllers => {
      :sessions => "devise/users/sessions",
      :registrations => "devise/users/registrations"
    }
    devise_scope :user do
     get '/users/sign_out' => 'devise/users/sessions#destroy'
   end

end
