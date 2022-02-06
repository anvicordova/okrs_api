Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :goals, only: [:index, :create] do
    post :bulk, on: :collection
    resources :key_results, only: [:create]
  end

  post 'authenticate', to: 'authentication#authenticate'
end
