Rails.application.routes.draw do
    devise_for :admins, :controllers => {
      :sessions => "devise/admins/sessions",
      :registrations => "devise/admins/registrations"
    }
    devise_for :users, :controllers => {
      :sessions => "devise/users/sessions",
      :registrations => "devise/users/registrations"
    }

  scope module: :users do
    root 'items#index' # ユーザーログイン機能動作確認のため担当ではないが記述
    resource :users
    resources :items, only: [:index, :show]
    resources :cart_items
    resources :orders, only: [:index, :new, :create] do
      collection do
        get :Completion
      end
    end
    resources :addresses
  end

  namespace :admins do
    root 'items#index'# 管理者ログイン機能動作確認のため担当ではないが記述
    resources :users
    resources :items
    resources :orders
    resources :labels
    resources :artists
    resources :genres
    resources :addresses
  end

end
