Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resource :patient, only: [:show]
  resource :doctor, only: [:show]

  resources :appointments, only: %i[index create]
  resources :recommendations, except: %i[index]

  root 'patients#show'
end
