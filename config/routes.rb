Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'categories#index'

  resources :categories do
    resources :products, only: [:index]
  end

  resources :products do
    collection do
      post :import
      get :export
    end

    member do
      get '/:id' => 'products#show'
    end
  end
end
