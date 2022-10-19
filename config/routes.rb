Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :cnab_transactions, only: [:index, :new, :create]
  resources :stores, only: [:index]

  root to: "home#index"
end
