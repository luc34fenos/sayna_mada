Rails.application.routes.draw do

  resources :cvs
  resources :students
  root 'home#index'

  get '/company_1' ,to: 'dashboard#dashboard01'
  get '/company_2' ,to: 'dashboard#dashboard02'

  get '/student_1' ,to: 'dashboard#dashboard1'
  get '/student_2' ,to: 'dashboard#dashboard2'

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
