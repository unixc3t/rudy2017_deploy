require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  resources :users, only: [:update] do
    collection do
      get :me
    end
  end
  root 'home#index'
  resources :products do
    resources :comments
    resources :images
    resources :likes, only: [] do
      collection do
        put :like
        put :unlike
      end
    end
  end

end
