require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations',
    confirmations: 'confirmations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"

  resources :logged_user do
    member do
    
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
