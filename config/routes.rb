Rails.application.routes.draw do
  root to: 'links#index'
  get    'signup'    => 'users#new',        as: :signup
  get    'signin'    => 'sessions#new',     as: :signin
  get    'users/:id' => 'users#show',       as: :user
  get    'tags/:tag' => 'links#index',      as: :tag
  post   'users'     => 'users#create',     as: :users
  post   'signin'    => 'sessions#create'
  delete 'signout'   => 'sessions#destroy', as: :signout
  resources :links
end
