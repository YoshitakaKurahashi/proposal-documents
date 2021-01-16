Rails.application.routes.draw do
  devise_for :users
  root to: "proposals#index"
  resources :proposals
end
