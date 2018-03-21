Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'main#index'
  resources :main, only: [:index] do
    collection do
      get :about
      get :gallery
      get :contacts
    end
  end

  resources :stuff_box, only: [:index] do
    collection do
      get :town
    end
  end
  
  resources :profile, only: [:index]
end
