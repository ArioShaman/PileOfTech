Rails.application.routes.draw do
  root to: 'main#index'
  resources :main, only: [:index] do
    collection do
      get :about
      get :gallery
    end
  end  
end
