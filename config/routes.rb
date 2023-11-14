Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/tasks", to: "tasks#list", as: "tasks"
  # "/tasks/new" needs to be on top of "/tasks/:id" in order for us not to get an error coz otherwise it will see the unique identifier (:id) and will pass it to see the /new
  get "/tasks/new", to: "tasks#new", as: "task_new"
  get "/tasks/:id", to: "tasks#task", as: "task"
  post "/tasks", to: "tasks#create"
  get "/tasks/:id/edit", to: "tasks#edit", as: "task_edit"
  patch "tasks/:id", to: "tasks#update"
  delete "tasks/:id", to: "tasks#destroy"
end
