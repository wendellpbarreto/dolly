Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  get '/oauth/callback' => 'o_auth#callback', as: :oauth_callback

  authenticated :user do
    root to: "main#dashboard"
  end

  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new", :as => "unauthenticated"
    end
  end

  resources :messages do
  end

  resources :reactions do
  end

  resources :friends, only: :index do
    collection do
      get :update_friends
    end
    member do
      get :messages
      get :liked_posts
    end
  end
end
