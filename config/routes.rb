Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  resources :budgets, only: %i[show new edit create update destroy] do
    resources :spending_plans, only: %i[create update new edit]
  end

  namespace :api, defaults: { format: :json } do
    resources :plaid, only: [] do
      post 'link_token', on: :collection
      post 'access_token', on: :collection
    end
  end
end
