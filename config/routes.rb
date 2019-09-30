Rails.application.routes.draw do
  resources :items, only: [:index, :create]
  resources :recipes, only: [:index, :create, :delete]
end
