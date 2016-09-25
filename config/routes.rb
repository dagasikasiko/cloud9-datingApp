Rails.application.routes.draw do
  get 'notes/new'

  get '/top' => 'home#top'
  get '/about' => 'home#about'
  get '/notes/:id' => 'notes#show', as:'note'

  post '/notes' => 'notes#create'

  root 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
