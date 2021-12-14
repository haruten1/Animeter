Rails.application.routes.draw do
  get "/" => "home#top"
  get "/signup" => "users#new"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get "/works/form" => "works#form"
  get "/works/search" => "works#search"
  post "/my_work/gold/:id" => "my_works#gold" 
  post "/my_work/silver/:id" => "my_works#silver" 
  post "/my_work/bronze/:id" => "my_works#bronze" 
  delete "/my_work/delete/:id" => "my_works#delete" 
  resources :users
end