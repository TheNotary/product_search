Rails.application.routes.draw do
  get 'pages/home'
  root to: 'pages#home'

  post '/semantics_api/search', to: 'semantics_api#search'

end
