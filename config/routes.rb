Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/plots', to: 'plots#index'
  delete '/plots/:plot_id/plants/:id', to: 'plant_plots#destroy'
end
