Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/plots", to: "plots#index"

  delete "/plots/:id/plants/plant_id", to: "plant_plots#destory", as: :remove_plant_from_plot
  
  resources :plots, only: [:index]  do
    resources :plants, only: [:destory], controller: "plant_plots"
  end
  #resources :plots, only: [:index]
end
