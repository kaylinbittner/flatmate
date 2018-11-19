Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root to: "flats#home"
  resources :flats do
    resources :bookings, only: [:new, :show, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
