Rails.application.routes.draw do
  get '/', to: 'application#index'
  
  resources :items, only: [:index, :create]
  resources :recipes, only: [:index, :create, :delete]
  post 'authenticate', to: 'authentication#authenticate'
end
