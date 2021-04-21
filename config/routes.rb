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

  root 'email/main#inbox'

  resources :email, controller: 'email/main'

  get '/inbox', to: 'email/main#inbox', as: 'inbox'
  get '/sent', to: 'email/main#sent', as: 'sent'
  get '/drafts', to: 'email/main#draft', as: 'drafts'
  get '/draft/:id', to: 'email/main#edit_draft', as: 'edit_draft'
  patch '/draft/:id', to: 'email/main#create', as: 'update_draft'
  get '/detail/:id', to: 'email/main#detail', as: 'detail'
  
  get '/starred', to: 'email/starred#index', as: 'starred'
  get '/starred/:mail_id', to: 'email/starred#add_starred', as: 'add_starred'

  get '/snoozed', to: 'email/snoozed#index', as: 'snoozed'
  get '/snoozed/:mail_id', to: 'email/snoozed#add_snoozed', as: 'add_snoozed'

  get '/important', to: 'email/important#index', as: 'important'
  get '/important/:mail_id', to: 'email/important#add_important', as: 'add_important'

  get '/trash', to: 'email/trash#index', as: 'trash'
  get '/trash/:mail_id', to: 'email/trash#add_trash', as: 'add_trash'
end
