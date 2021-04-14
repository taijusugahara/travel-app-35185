Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index' 
  resources :countries do
    resources :planes, only: [:index, :new, :create]
  end
end
