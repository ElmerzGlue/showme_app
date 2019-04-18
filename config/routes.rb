Rails.application.routes.draw do
  get 'static/home'

  get 'static/about'

  get 'static/contact'

  root 'application#hello'
end
