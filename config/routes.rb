Rails.application.routes.draw do
  resources :orders
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [:index, :create] do #, only: []
      resources :items, only: [:create, :destroy, :update]
    end

    #  resources :orders

  end
end
