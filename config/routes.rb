Rails.application.routes.draw do
  resources :appoitments
  resources :agents
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
