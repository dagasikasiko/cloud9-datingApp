Rails.application.routes.draw do

  resources :users
  resources :notes

  root 'home#top'
  get '/about' => 'home#about'
end
