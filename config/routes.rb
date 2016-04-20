Rails.application.routes.draw do


  get 'sessions/login'

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'

  get 'sessions_controller/login'

  root 'main#index'

  get 'login' => 'sessions#login'

  delete '/logout',
    to: "sessions#destroy"

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' }
end
