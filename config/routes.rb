Rails.application.routes.draw do

  get '/about', to: 'static#about'

  get '/contact', to: 'static#contact'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/login', to: 'sessions#destroy'

  root 'static#home'

  resources :users

end
