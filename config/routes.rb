Rails.application.routes.draw do

  get '/about', to: 'static#about'

  get '/contact', to: 'static#contact'

  get '/rules', to: 'static#rules'

  get '/rules/ShowMeCompRules', to: 'static#get_rules'

  get '/rules/ShowMeRulesEvidence', to: 'static#get_rules_evidence'

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

  resources :activations, only: [:edit]

end
