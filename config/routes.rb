Rails.application.routes.draw do
  root to: "pages#home"
  resources :users
  resources :sessions
  resources :messages
  namespace :api, defaults: { format: :json } do
    devise_for :users, controllers: {
      registrations: 'api/registrations',
      sessions: 'api/sessions'
    }
  end
end
