Rails.application.routes.draw do
  get 'static_pages/quiz'
  get 'google_maps/thai'
  get 'google_maps/cambo'
  get 'google_maps/vet'
  get 'google_maps/malaysia'
  get 'google_maps/singapore'
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
  resources :quizs, only: :index
end
