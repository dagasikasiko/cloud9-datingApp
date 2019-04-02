Rails.application.routes.draw do
  
  
  #post 'sessions/new'

  resources :userimages
  get 'messages/index'
  post 'chat/selecter' => 'chat#selecter'

  get 'leave/goodbye'
  get 'leave/thankyou'
  
  post 'games/result' => 'games#result'
  
  get 'gacha/stampgacha' => 'gacha#stampgacha'
  get 'gacha/friendgacha' => 'gacha#friendgacha'
  get 'gacha/lovergacha' => 'gacha#lovergacha'
  get 'gacha/premiumgacha' => 'gacha#premiumgacha'
  get 'gacha/stampresult' => 'gacha#stampresult'
  get 'gacha/friendresult' => 'gacha#friendresult'
  get 'gacha/loverresult' => 'gacha#loverresult'
  get 'gacha/premiumresult' => 'gacha#premiumresult'
  get '/gacha/:checkid', to: 'gacha#premiumgacha', as: 'gacha'
  
  
  get 'type/choice' => 'type#choice'
  get 'type/men' => 'type#men'
  get 'type/women' => 'type#women'
  post 'type/result' => 'type#result'
  

  root 'home#top'
  get '/about' => 'home#about'
  get '/users/sign_out' => 'devise/sessions#destroy'
  

  get 'images/new' => 'images#new'
  get 'images/show' => 'images#show'
  get 'images/index' => 'images#index'
  
  # get 'userimage/new' => 'userimage#new'
  # get 'userimage/show' => 'userimage#show'
  # get 'userimage/index' => 'userimage#index'
  
  post '/frids/new'
  # post '/frids/create'
  get '/frids/create'
  
  
  get 'users/:id/mystamp', to: 'users#mystamp', as:'mystamp_user'
  
  get 'users/:id/userimage', to: 'userimage#new', as:'userimage_user'
  
  
  get 'errors/error' => 'errors#error'
  
  # get '*anything' => '404'
  
  
# get 'stampimages/index' => 'stampimages#index'
  

  devise_for :users
  resources :users
  resources :notes
  resources :gacha
  resources :frids
  resources :games
  resources :chat
  resources :stampgacha
  resources :friendgacha
  resources :lovergacha
  resources :premiumgacha
  resources :stampimages
  
  
  resources :images
    resources :images do
    member do
      get 'show_image'
  end
  end
  
  
  # get    'admin/login'   => 'sessions#new'
  # post   'admin/login'   => 'sessions#create'
  # delete 'admin/logout'  => 'sessions#destroy'
  
  get '/admin/top' => 'admin/home#about'
  get 'admin' => 'admin#index'
  get 'admin/chat' => 'admin/chat#index'
  namespace :admin do
    resources :notes
    resources :users
    resources :stampimages

  end




  # Serve websocket cable requests in-process
  mount ActionCable.server => '/websocket'
  
  
  get '*anything' => 'errors#error'
    
end
