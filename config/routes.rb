Rails.application.routes.draw do
  resources :search_caches
  get 'pages/home'
  root to: 'pages#home'

  post '/semantics_api/search', to: 'semantics_api#search'

end
