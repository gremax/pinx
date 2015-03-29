Rails.application.routes.draw do
  get  'signup'    => 'users#new',    as: :signup
  get  'users/:id' => 'users#show',   as: :user
  post 'users'     => 'users#create', as: :users
end
