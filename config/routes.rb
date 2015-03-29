Rails.application.routes.draw do
  get    'signup'    => 'users#new',        as: :signup
  get    'signin'    => 'sessions#new',     as: :signin
  get    'users/:id' => 'users#show',       as: :user
  post   'users'     => 'users#create',     as: :users
  post   'signin'    => 'sessions#create'
  delete 'signout'   => 'sessions#destroy', as: :signout
end
