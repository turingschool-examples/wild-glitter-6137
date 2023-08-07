Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :plots, only: [:index] do
    resources :plants, only: [:destroy], controller: "plant_plots"
  end

  resources :gardens, only: [:show]
end
