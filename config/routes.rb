Rails.application.routes.draw do
  get "/" => "home#top"
  get "/signup" => "users#new"
  resources :users
end