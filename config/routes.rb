Rails.application.routes.draw do
  get "/" => "home#top"
  get "/signup" => "users#new"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get "/works/form" => "works#form"
  get "/works/search" => "works#search"
  post "/my_work/create/:id" => "my_works#create" 
  resources :users
end