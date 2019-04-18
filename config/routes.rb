Rails.application.routes.draw do
  get '/home', to: 'static#home'

  get '/about', to: 'static#about'

  get '/contact', to: 'static#contact'

  root 'static#home'
end
