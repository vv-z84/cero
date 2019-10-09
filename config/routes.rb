Rails.application.routes.draw do
  defaults format: :json do
    resources :items, only: [:index, :create]
    resources :recipes, only: [:index, :create, :delete]
    post '/authenticate', to: 'authentication#authenticate'
    post '/register', to: 'authentication#create'
  end
  
  root 'application#index'
  get '*path', to: 'application#index'
end
