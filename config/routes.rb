Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cvs
  resources :students
  root 'home#index'

  get '/company_1' ,to: 'dashboard#company_dashboard1'
  get '/company_2' ,to: 'dashboard#company_dashboard2'

  get '/student_1' ,to: 'dashboard#student_dashboard1'
  get '/student_2' ,to: 'dashboard#student_dashboard2'

  get '/concours' ,to: 'dashboard#concour'

  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  resources :staffs
  resources :companies
  resources :entreprises

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :states, only: :index

end
