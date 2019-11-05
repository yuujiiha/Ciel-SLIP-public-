Rails.application.routes.draw do
  resources :concerts
  devise_for :users
  resources :songs
  resources :albums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#top"
  get "/about", to: "home#about"
  get "/music", to: "home#music"
  get "/music/albums", to: "albums#albums_index"
  get "/music/albums/:id", to: "albums#show"
  get "/music/singles", to: "albums#singles_index"
  
  get "/music/songs", to: "songs#index"
  
  get "/admin", to: "admin#admin_login"
  
  get "/concerts/:title/detail", to: "concerts#show"
  get "/concerts/:title/destroy", to: "concerts#destroy"
end
