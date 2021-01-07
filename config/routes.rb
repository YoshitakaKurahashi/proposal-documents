Rails.application.routes.draw do
  get 'proposals/index'
  root to: "proposals#index"
end
