Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'books',              to: 'books#index'
  get 'books/prime',        to: 'books#prime'
  get 'lists/books',        to: 'lists#index'
  get 'articles',           to: 'articles#index'
  get 'search/filter',      to: 'search#index'
  
end
