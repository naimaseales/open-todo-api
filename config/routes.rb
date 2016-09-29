Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [:index, :create] do #, only: []
      resources :items, only: [:create, :destroy, :update]
    end

    #  resources :items, only: [:index]
  end
end
