Rails.application.routes.draw do
  resources :combinations
  resources :products

  root to: 'combinations#index'
end
