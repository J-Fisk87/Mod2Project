Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :characters, only: [:show, :new, :create, :edit, :update]
  resources :spells, only: [:show]
  resources :klasses, only: [:index, :show]
end
