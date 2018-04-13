Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'searchs/index'

  # root "static_pages#home"
  root "books#index"
  resources :books, only: %i(index show) do
    resources :request_books
    resources :likes
    resources :reviews
  end
  resources :authors, only: %i(index show)
  devise_for :users
  resources :users
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
