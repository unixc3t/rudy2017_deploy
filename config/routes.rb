require 'sidekiq/web'

Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #get '/users/auth/:provider/callback', to: 'sessions#create'

  mount Sidekiq::Web => '/sidekiq'
  devise_for :users

  namespace 'api' do
    resources :products
  end


  resources :users, only: [:update] do
    collection do
      get :me
    end
  end
  root 'home#index'
  resources :products do
    resources :comments
    resources :images
    resources :likes, only: [], defaults: { format: 'json' } do
      collection do
        put :like
        put :unlike
      end
    end
  end

end
