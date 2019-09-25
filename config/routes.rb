Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :new, :show, :create]  

  get '/search', to: 'heroines#index'

end
