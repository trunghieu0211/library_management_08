Rails.application.routes.draw do
  root "static_pages#home"
  resources :books, only: %i(index show)
  resources :authors, only: %i(index show)
  devise_for :users
  namespace :admin do
    root "static_pages#home"
    resources :users, except: %i(show)
    resources :categories, except: %i(show)
    resources :authors, except: %i(show)
    resources :publishers, except: %i(show)
    resources :request_books, except: %i(show)
    resources :books, except: %i(show)
  end
end
