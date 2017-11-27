Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :appoitments
  resources :agents
  resources :clients

  get 'distance', to: "appointments#calculate_distance"
  get 'direction', to: "appointments#calculate_direction"

  root to: "clients#index"
end
