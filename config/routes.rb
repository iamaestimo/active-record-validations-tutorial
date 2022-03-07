Rails.application.routes.draw do
  resources :subscriptions
  resources :plans
  resources :users
  
  root "users#index"
end
