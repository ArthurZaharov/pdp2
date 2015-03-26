Rails.application.routes.draw do
  devise_for :users

  resources :articles, only: %i(index show new create edit update) do
    resources :comments, only: :create
  end

  root to: 'articles#index'
end
