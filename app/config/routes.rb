Rails.application.routes.draw do

  resources :isseys
  devise_for :users
  resources :users
  resources :notes

  root 'home#top'
  get '/about' => 'home#about'

  get '/users/sign_out' => 'devise/sessions#destroy'
end
