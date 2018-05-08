Rails.application.routes.draw do
  get 'relationship_users/create'

  get 'relationship_users/desstroy'

  root "books#index"
  resources :books, only: %i(index show) do
    resources :request_books
    resources :likes
    resources :reviews
    member do
      get :following, :followers
    end
  end

  resources :relationship_users, only: [:create, :destroy]
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
