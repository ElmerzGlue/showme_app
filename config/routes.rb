Rails.application.routes.draw do

  get '/about', to: 'static#about'

  get '/contact', to: 'static#contact'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'sessions#profile'

  get '/list', to: 'sessions#list'

  root 'static#home'

  resources :users

end
