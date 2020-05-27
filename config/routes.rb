Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get 'dashboard', to: 'pages#dashboard'

  # devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' } do
  resources :meetings, only: [ :index, :show, :new, :create ]
   # end

  resources :dogs, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]



end
