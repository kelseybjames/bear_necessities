Rails.application.routes.draw do
  resources :bears
  root to: 'bears#index'
end
