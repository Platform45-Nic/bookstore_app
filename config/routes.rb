Rails.application.routes.draw do
  root to: 'static_pages#home'
  get  'static_pages/home', as: 'home'
  get  'index', to: 'static_pages#index'

  resource :users, only: [:edit] do
    collection do
      patch 'update'
    end
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  resources :books do 
    get 'books/profile', to: 'books#profile', as: 'profile'
  end
  resources :genres
end
