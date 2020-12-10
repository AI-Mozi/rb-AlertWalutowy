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
    end
  end

  resources :user_currency, only: [:new, :create]

  mount Sidekiq::Web => '/sidekiq'
end
