Rails.application.routes.draw do
  devise_for :users
  resources :articles

  root to: 'dashboard#index'
end
