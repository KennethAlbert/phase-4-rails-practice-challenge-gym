Rails.application.routes.draw do
  resources :memberships,only:[:index,:create,:destroy]
  resources :gyms
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
