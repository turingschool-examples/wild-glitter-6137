Rails.application.routes.draw do
  get "/plots", to: "plots#index"
  post "/remove_plant", to: "plots#remove_plant"
  get "/gardens/:id", to: "gardens#show"
end
