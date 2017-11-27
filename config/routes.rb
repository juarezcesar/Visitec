Rails.application.routes.draw do
  resources :appoitments
  resources :agents
  resources :clients

  get 'distance', to: "appointments#calculate_distance"
  get 'direction', to: "appointments#calculate_direction"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
