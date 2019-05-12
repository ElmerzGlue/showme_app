Rails.application.routes.draw do
  get '/', to: 'static#home'

  get '/about', to: 'static#about'

  get '/contact', to: 'static#contact'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  root 'static#home'

  resources :users

end
