Rails.application.routes.draw do
  root to: 'static_pages#index'

  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  resources :books #do 
    #get 'genre/:name', to: 'genre#index', as: 'genre'
  #end
  resources :genres
end
