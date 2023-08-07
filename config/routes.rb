Rails.application.routes.draw do
  resources :plots, only: [:index, :destroy] do
  end
  resources :gardens, only: :show do
  end
end
