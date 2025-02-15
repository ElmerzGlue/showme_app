Rails.application.routes.draw do

  get '/about', to: 'static#about'

  get '/contact', to: 'static#contact'

  get '/rules', to: 'static#rules'

  get '/rules/ShowMeCompRules', to: 'static#get_rules'

  get '/rules/ShowMeRulesEvidence', to: 'static#get_rules_evidence'

  get '/rules/highlights', to: 'static#rule_highlights'

  get '/case', to: 'static#case'

  get '/case/download', to: 'static#get_case'
  
  get '/schedule', to: 'static#schedule'

  get '/location', to: 'static#location'

  get '/deadlines', to: 'static#deadlines'
  
  get '/ballot', to: 'static#get_ballot'

  get '/comments', to: 'static#get_guidelines'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  post '/pay_registration', to: 'sessions#pay_registration'

  delete '/delete', to: 'sessions#delete'

  get '/profile', to: 'sessions#profile'

  get '/list', to: 'sessions#list'

  get '/teams', to: 'sessions#teams'

  get '/teams/rankings', to: 'teams#rankings'

  get '/teams/:id/edit', to: 'teams#edit'

  delete '/students/:id/delete', to: 'students#delete'

  get '/students/rankings', to: 'students#rankings'

  post '/teams/:id/edit', to: 'teams#addStudent'

  get '/resend', to: 'sessions#resend'

  get '/trials/schedule', to: 'trials#new'

  post '/trials/schedule', to: 'trials#create'

  get '/trials/list', to: 'trials#schedule'

  get '/trials/:id/score', to: 'trials#score_form'

  post '/trials/:id/score', to: 'trials#score'

  root 'static#home'

  resources :users

  resources :teams, only: [:delete]

  resources :activations, only: [:edit]

  resources :password_resets, only: [:new, :create, :edit, :update]

end

