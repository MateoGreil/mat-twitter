Rails.application.routes.draw do
  root 'home#index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'signin', to: 'users#signin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
