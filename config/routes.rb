Rails.application.routes.draw do

  root 'professionals#index'

  devise_for :users

  get 'professionals' => 'professionals#index', as: :professionals
  get 'professionals/:id' => 'professionals#show', as: :professional
  get 'professionals/:id/edit' => 'professionals#edit', as: :edit_professional
  put 'professionals/:id' => 'professionals#update'
  patch 'professionals/:id' => 'professionals#update'
  delete 'professionals/:id' => 'professionals#destroy'

  get 'physicians' => 'physicians#index', as: :physicians
  get 'physicians/new' => 'physicians#new', as: :new_physician
  post 'physicians' => 'physicians#create'

  get 'attorneys' => 'attorneys#index', as: :attorneys
  get 'attorneys/new' => 'attorneys#new', as: :new_attorney
  post 'attorneys' => 'attorneys#create'

  get 'professionals/:id/reviews/new' => 'reviews#new', as: :new_review
  get 'reviews/:id' => 'reviews#show', as: :review
  get 'reviews/:id/edit' => 'reviews#edit', as: :edit_review
  post 'reviews' => 'reviews#create'
  put 'reviews/:id' => 'reviews#update'
  patch 'reviews/:id' => 'reviews#update'
  delete 'reviews/:id' => 'reviews#destroy'
end
