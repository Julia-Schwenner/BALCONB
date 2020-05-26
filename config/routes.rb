Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get 'dashboard', to: 'pages#dashboard'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
    # if necessary, reviews nested

  # resources :balconies, only: [ :index, :show, :new, :create ]
  # resources :bookings, only: [ :show, :new, :create ]

end
