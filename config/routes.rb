Rails.application.routes.draw do
  get "/plots/index", to: "plots#index"
  delete "plots/:id", to: "plots#destroy"
end
