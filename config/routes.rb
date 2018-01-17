Rails.application.routes.draw do
  root to: 'main#index'
  resources :main, only: [:index] do
    collection do
      get :next
    end
  end  
end
