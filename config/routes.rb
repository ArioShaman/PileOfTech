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
  get '/gallery/sites', to: 'main#sites'
  get '/gallery/design', to: 'main#design'

  resources :stuff_box, only: [:index] do
    collection do
      get :town
      get :coffee
    end
  end
  
  resources :profiles, only: [:index] do
    # collection do
    #   get :project
    # end
  end
end
