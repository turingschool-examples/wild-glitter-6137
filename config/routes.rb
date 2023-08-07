Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :gardens, only: [:show] do
    resources :plots, only: [:index]
    resources :plants, only: [:destroy]
  end
end
