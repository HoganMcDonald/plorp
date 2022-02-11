Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    resources :plaid, only: [] do
      post 'link_token', on: :collection
    end
  end
end
