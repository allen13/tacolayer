Rails.application.routes.draw do
  resources :tacos
  root to: 'visitors#index'
end
