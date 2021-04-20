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

  root 'email#inbox'

  resources :email, controller: 'email'
  get '/inbox', to: 'email#inbox', as: 'inbox'
  get '/starred', to: 'email#starred', as: 'starred'
  get '/starred/:mail_id', to: 'email#add_starred', as: 'add_starred'
  get '/snoozed', to: 'email#snoozed', as: 'snoozed'
  get '/important', to: 'email#important', as: 'important'
  get '/important/:mail_id', to: 'email#add_important', as: 'add_important'
  get '/sent', to: 'email#sent', as: 'sent'
  get '/drafts', to: 'email#draft', as: 'drafts'
  get '/trash', to: 'email#trash', as: 'trash'
  get '/trash/:mail_id', to: 'email#add_trash', as: 'add_trash'
end
