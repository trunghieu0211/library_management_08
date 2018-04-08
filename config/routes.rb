Rails.application.routes.draw do
  root "static_pages#home"
  resources :books, only: [:index, :show]
  devise_for :users
  namespace :admin do
    root "static_pages#home"
    resources :users
  end
end
