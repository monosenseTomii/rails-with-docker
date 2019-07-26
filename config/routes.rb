Rails.application.routes.draw do
  resources :users
  resources :articles
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  get     'logout',  to: 'sessions#destroy'
end
