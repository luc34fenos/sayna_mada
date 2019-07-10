Rails.application.routes.draw do

  resources :entreprises
  root 'home#index'

 get 'home/acce'
  devise_for :users

 get '/company_1' , to: 'company#dashboard01'
 get '/company_2' , to: 'company#dashboard02'

 get '/student_1' , to: 'students#dashboard1'
 get '/studnet_2' , to: 'students#dashboard2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  resources :states, only: :index

end
