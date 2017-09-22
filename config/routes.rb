Rails.application.routes.draw do

  root 'home#index'
  resources :products do
    resources :comments
  end

end
