Rails.application.routes.draw do
  resources :plots, only: [:index, :destroy] do
    resources :plant_plots, only: :destroy
  end
  resources :gardens, only: :show do
  end
end
