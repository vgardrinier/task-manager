Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "tasks#index", as: :tasks
  get "/new", to: "tasks#new", as: :new
  get "/:id", to: "tasks#show", as: :show
  post "/", to: "tasks#create"
  get '/:id/edit', to: "tasks#edit", as: :edit
  patch '/:id', to: "tasks#update", as: :task
  delete "/:id", to: "tasks#destroy", as: :destroy
end
