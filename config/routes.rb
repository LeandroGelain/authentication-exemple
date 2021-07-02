Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Users
  devise_scope :user do
    put 'password', to: 'users/passwords#update'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  post 'users/login', to: 'authentication#authenticate'

  get 'users/me', to: 'users#me'
  post 'users/', to: 'users#create'
end
