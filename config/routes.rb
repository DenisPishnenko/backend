Rails.application.routes.draw do
  devise_for :users
  resources :news
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "news#index"
end
