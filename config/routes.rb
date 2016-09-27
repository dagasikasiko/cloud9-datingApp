Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :notes

  root 'home#top'
  get '/about' => 'home#about'
end
