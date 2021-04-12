Rails.application.routes.draw do
  devise_for :users
  root to: 'planes#index' 
end
