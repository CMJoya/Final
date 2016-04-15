Rails.application.routes.draw do

  get 'home/index'

  devise_for :users

  resources :physicians do
    resources :reviews
  end

  resources :attorneys do
    resources :reviews
  end

  root 'home#index'
end
