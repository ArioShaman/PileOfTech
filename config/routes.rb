Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  root to: 'main#index'
  resources :main, only: [:index] do
    collection do
      get :about
      get :gallery
    end
  end  
end
