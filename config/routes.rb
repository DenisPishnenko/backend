Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json },
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }             
  resources :users, only: [:show, :update] do
    resource :news, only: :create
  end 
  resources :news, only: :index  

  get '/member-data', to: 'members#show'
  root "news#index"
end
