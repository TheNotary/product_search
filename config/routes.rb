Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  root to: 'pages#home'

  post '/semantics_api/search', to: 'semantics_api#search'

end
