Rails.application.routes.draw do
  resources :powers
  resources :heroines

  # get '/heroines/power', to: 'heroines#power'
  # post '/heroines/power/:id', to: 'heroines#filter'
end
