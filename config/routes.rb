Rails.application.routes.draw do

  resources :staffs
  resources :companies
  resources :entreprises
  root 'home#index'

 get 'home/acce'
  devise_for :users

 get '/company_1' , to: 'dashboard#dashboard01'
 get '/company_2' , to: 'dashboard#dashboard02'

 get '/student_1' , to: 'dashboard#dashboard1'
 get '/student_2' , to: 'dashboard#dashboard2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  resources :states, only: :index

end
