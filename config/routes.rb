Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  },
  path: '',
  path_names: { 
    sign_in: 'login', 
    sign_out: 'logout', 
    password: 'secret', 
    confirmation: 'verification', 
    unlock: 'unblock', 
    registration: 'register', 
    sign_up: '' 
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
end
