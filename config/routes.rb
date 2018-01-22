Rails.application.routes.draw do
  resources :routes
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :appoitments
  resources :agents
  resources :clients

  get 'distance', to: "appointments#calculate_distance"
  get 'route', to: "appointments#calculate_route_optimization"
  get 'map', to: "appointments#show_map"

  root to: "clients#index"
end
