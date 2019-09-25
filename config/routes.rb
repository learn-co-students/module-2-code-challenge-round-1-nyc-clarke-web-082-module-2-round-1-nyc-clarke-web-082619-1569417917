Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create]

  # resources :heroines do
  #   member do
  #     post :search
  #   end
  # end
end

  
