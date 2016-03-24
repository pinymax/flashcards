Rails.application.routes.draw do

  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  resources :users
  root "cards#train"
  resources :cards do
    member do
      get   :train
      post  :check_translation
    end
  end

  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
