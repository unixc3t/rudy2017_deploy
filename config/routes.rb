Rails.application.routes.draw do

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
  end

end
