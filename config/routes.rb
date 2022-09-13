Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json },
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }  
  resources :news
  resources :users

  get '/member-data', to: 'members#show'
  root "news#index"
end
