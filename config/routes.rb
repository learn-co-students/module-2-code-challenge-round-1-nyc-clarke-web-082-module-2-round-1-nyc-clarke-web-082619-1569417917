Rails.application.routes.draw do
  resources :powers, only: [:index, :new, :create, :show, :udpate, :edit, :delete]
  resources :heroines, only: [:index, :new, :create, :show, :udpate, :edit, :delete]   

  root 'heroines#home'
end
