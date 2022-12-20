Rails.application.routes.draw do
  get '/index', to: 'pokemon#index'
  post "/index", to: 'pokemon#index'
end
