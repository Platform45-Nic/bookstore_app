Rails.application.routes.draw do
  root to: 'static_pages#home'
  get  'home', to: 'static_pages#home'
  get  'index', to: 'static_pages#index'

  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :users, only: [:edit, :update]
  resources :books 
  resources :genres
  resources :transactions, only: [:index, :show, :new, :create]
end
