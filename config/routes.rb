Rails.application.routes.draw do
  root to: "flats#home"
  devise_for :users, :controllers => { registrations: 'registrations' }
  get :my_profile, to: "users#my_profile"

  resources :flats do
    resources :bookings, only: [:new, :show, :create, :destroy] do
    end
  end

  resources :flats do []
    resources :reviews, only: :show
  end

  resources :bookings, only: [] do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
