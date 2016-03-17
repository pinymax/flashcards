Rails.application.routes.draw do

  root "cards#train"

  resources :cards do
    member do
      get   :train
      post  :check_translation
    end
  end
end
