Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'main#index'
  resources :main, only: [:index] do
    collection do
      get :about
      get :gallery
    end
  end  
  resources :profile, only: [:index]
end
