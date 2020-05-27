Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get 'dashboard', to: 'pages#dashboard'

  # devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
    # if necessary, reviews nested

<<<<<<< HEAD
  resources :dogs, only: [ :index, :show, :new, :create, :edit, :update ]
=======
  resources :dogs, only: [ :index, :show, :new, :create, :destroy ]
>>>>>>> 1760176b40d7bed90a6c72b0e088e46593720ba0
  # resources :bookings, only: [ :show, :new, :create ]

end
