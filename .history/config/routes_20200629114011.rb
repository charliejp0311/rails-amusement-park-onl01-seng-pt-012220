Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ##User routes
  resources :users, only: [:new, :create, :show]

  ## Sign in and out routes
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

  ##admin namespace
  namespace :admin do
    resources :sessions
  end
  
  ##Root route required not sure if this is the right route but it is for now LOL
  root 'welcome#home'

end
