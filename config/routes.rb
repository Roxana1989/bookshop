Rails.application.routes.draw do
  resources :books, only: :index

  namespace :books do
    resources :prime, only: :index
  end

  namespace :lists do
    resources :books, only: :index
  end

  resources :articles, only: :index

  namespace :search do
    resources :filter, only: :index
  end
end
