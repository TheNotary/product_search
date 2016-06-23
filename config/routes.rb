Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  get 'pages/admin'
  match '/admin', to: 'pages#admin', via: :get
  root to: 'pages#home'

  post '/semantics_api/search', to: 'semantics_api#search'
  post '/semantics_api/warm_cache', to: 'semantics_api#warm_cache'

end
