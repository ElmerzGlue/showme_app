Rails.application.routes.draw do

  get '/about', to: 'static#about'

  get '/contact', to: 'static#contact'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  post '/pay_registration', to: 'sessions#pay_registration'

  delete '/delete', to: 'sessions#delete'

  get '/profile', to: 'sessions#profile'

  get '/list', to: 'sessions#list'

  root 'static#home'

  resources :users

  resources :teams

end
