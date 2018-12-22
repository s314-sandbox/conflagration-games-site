Rails.application.routes.draw do
  devise_for :users
  get 'sample/index'
  root 'landing#index'
  resources :articles
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end