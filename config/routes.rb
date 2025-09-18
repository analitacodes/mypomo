Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

# Home = single-page dashboard (task input + timer + recent sessions/prompt)
root "dashboard#show"


# Tasks still available for CRUD (scoped to current_user in controller)
resources :tasks

# Single endpoint the page will POST to after a Pomodoro ends (when signed in)
resources :focus_sessions, only: [ :create ]

get "up" => "rails/health#show", as: :rails_health_check
end
