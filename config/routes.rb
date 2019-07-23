Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cvs do
    resource :download, only: [:show]
  end
  resources :students, only: [:index, :show, :edit, :update, :destroy]
  root 'home#index'

  get '/company_1' ,to: 'dashboard#company_dashboard1'
  get '/company_2' ,to: 'dashboard#company_dashboard2'

    get '/mondashboard', to: 'dashboard#show'

    get '/moncv/:id', to: 'cvs#show'
    get '/moncv/:id/edit', to: 'cvs#edit'

    get '/monprofil/:id', to: 'students#show'
    get '/monprofil/:id/edit', to: 'students#edit'

    get '/monprofile/:id', to: 'companies#show'
    get '/monprofile/:id/edit', to: 'companies#edit'

  get '/student_1' ,to: 'dashboard#student_dashboard1'
  get '/student_2' ,to: 'dashboard#student_dashboard2'

  get '/concours' ,to: 'dashboard#concour'
  get '/card' , to: 'dashboard#card'

  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  resources :staffs
  resources :companies
  resources :skills, only: [:create, :update, :destroy]
  resources :languages, only: [:create, :update, :destroy]
  resources :experiences, only: [:create, :update, :destroy]
  resources :programming_languages, only: [:create, :update, :destroy]
  resources :backgrounds, only: [:create, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :states, only: :index

  match '*path' => 'home#not_found', via: :all
end
