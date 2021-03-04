require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }

  root to: "home#index"
  #get '/add_currency', to: 'user_selection#new'

  resources :logged_user do
    member do
      get :confirm_email
    end
  end

  namespace :api do
    resources :currencies, only: [:index]
  end

  resources :user_currency, only: [:new, :create]
  resources :bid_ask_currency, only: [:edit, :update]

  mount Sidekiq::Web => '/sidekiq'
end
