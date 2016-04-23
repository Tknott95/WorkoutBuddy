Rails.application.routes.draw do

  get 'profiles/edit' => 'profiles#edit'

  get 'sessions/login'

  get 'workouts' => 'workouts#new'
  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'

  get 'users/:id' => 'users#show'
  get 'users' => 'users#index'

  get 'sessions_controller/login'

  get 'users/signup' => 'users#form'

  root 'main#index'

  get 'about' => 'main#about'
  get'contact' => 'main#contact'



  delete '/logout',
    to: "sessions#destroy"

  get 'verification/:token', to: 'users#verify', as: 'verify_email'


resources :users,
  only: [:new, :create],
  path_names: {new: 'signup'}
end
