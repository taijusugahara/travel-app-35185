Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index' 
  resources :countries, except: [:edit, :update] do
    resources :planes, except: :show
    resources :hotels, except: :show
  end
end
