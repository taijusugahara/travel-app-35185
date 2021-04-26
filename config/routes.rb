Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index' 
  resources :countries, except: [:edit, :update] do
    resources :planes, except: :show
    resources :plane_gos, except: :show
    resources :plane_backs, except: :show
    resources :hotels, except: :show
    resources :tours, except: :show
    resources :orders, only: [:index,:create]
  end
end
