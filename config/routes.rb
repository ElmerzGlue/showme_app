Rails.application.routes.draw do
  get '/home', to: 'static#home'

  get '/about', to: 'static#about'

  get '/contact', to: 'static#contact'

  get '/signup', to: 'users#new'

  root 'static#home'

  resources :users

end
