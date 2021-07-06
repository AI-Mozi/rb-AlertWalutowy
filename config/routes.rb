# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               registrations: 'registrations',
               confirmations: 'confirmations'
             }

  root to: 'home#index'
  # get '/add_currency', to: 'user_selection#new'

  resources :logged_user do
    member do
      get :confirm_email
    end
  end

  namespace :api do
    resources :currencies, only: [:index]
  end

  resources :user_currency, only: %i[new create]
  resources :bid_ask_currency, only: %i[edit update]
  resources :currencies_converter, only: :index
  resources :home, only: %i[index change_currency]
  resources :pdf_generator, only: :index

  mount Sidekiq::Web => '/sidekiq'
end
