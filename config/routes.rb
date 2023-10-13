Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :pokemons do
    resources :bookings, only: :create
  end

  resources :bookings, only: :destroy

  get "/dashboard", to: "pages#dashboard"

  get "/choice", to: "pages#choice"

  # Routes optionnelles
  resources :users, only: [] do
    member do
      patch :filter
    end
  end

  # truc

end
