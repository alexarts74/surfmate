Rails.application.routes.draw do
  root to: "pages#home"
  resources :users
  resources :sessions
  resources :messages
end
