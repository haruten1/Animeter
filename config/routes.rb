Rails.application.routes.draw do
  get "/" => "home#top"
  get "/signup" => "users#new"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end