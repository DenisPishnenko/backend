Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json },
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }             
  resources :users do
    resources :news, only: :create
  end 
  resources :users
  resources :news  

  get '/member-data', to: 'members#show'
  root "news#index"
end
