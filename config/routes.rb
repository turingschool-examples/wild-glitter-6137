Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/plots", to: "plots#index"

  delete "/plots/:plot_id/plants/:plant_id", to: "plant_plots#destroy", as: :plant_plot
end
