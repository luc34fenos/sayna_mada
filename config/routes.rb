Rails.application.routes.draw do

  resources :cvs
  resources :students
  root 'home#index'

  get '/company_1' ,to: 'company#dashboard01'
  get '/company_2' ,to: 'company#dashboard02'

  get '/student_1' ,to: 'students#dashboard1'
  get '/student_2' ,to: 'students#dashboard2'

  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :states, only: :index

end
