Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  
  root to: 'static_pages#index'
end
