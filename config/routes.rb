Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :plots, only: [:index] do
    resources :plants, only: [], controller: 'plots/plants' do
      delete 'remove', on: :member, to: 'plots/plants#remove', as: :remove
    end
  end
  
end
