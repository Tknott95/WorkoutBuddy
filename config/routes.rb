Rails.application.routes.draw do
default_url_options host: 'localhost', port: 3000

  get 'sessions/login'

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'

  get 'sessions_controller/login'

  root 'main#index'

  get 'login' => 'sessions#login'

  delete '/logout',
    to: "sessions#destroy"

  get 'verification/:token', to: 'users#verify', as: 'verify_email'

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' }
end
