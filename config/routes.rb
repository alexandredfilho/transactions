Rails.application.routes.draw do
  resources :cnab_transactions, only: [:index, :new, :create]
  resources :stores, only: [:index]

  root 'stores#index'
end
