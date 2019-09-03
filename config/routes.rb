Rails.application.routes.draw do

  resources :searches, only: [:new, :create, :index, :show]
  resources :checkings, only: [:create, :update]
  get 'downloads_controller/show'
  get 'downloads_controller/cv_pdf'
  get 'downloads_controller/send_cv_pdf'
  resources :posts
  resources :notifications
  resources :webs
  resources :swebs, only: [:create, :update, :destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cvs do
    resource :download, only: [:show]
    resources 'cover_letters'
  end
  resources :students, only: [:index, :show, :edit, :update, :destroy]

  ############################# vitrine ###############################
  root 'vitrines#index'

  get '/team', to: 'vitrines#team'
  get '/simplon', to: 'vitrines#simplon'
  get '/thp', to: 'vitrines#thp'

  #############################   end   ###############################

  get '/mondashboard', to: 'dashboard#show'

  get '/moncv/:id', to: 'cvs#show'
  get '/moncv/:id/edit', to: 'cvs#edit'

  get '/moncv/:cv_id/malm/:id', to: 'cover_letters#show'
  get '/moncv/:cv_id/malm/:id/edit', to: 'cover_letters#edit'

  get '/monprofil/:id', to: 'students#show'
  get '/monprofil/:id/edit', to: 'students#edit'

    get '/monprofile/:id', to: 'companies#show'
    get '/monprofile/:id/edit', to: 'companies#edit'

  get '/concours' ,to: 'dashboard#concour'
  get '/card' , to: 'dashboard#card'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  	sessions: 'users/sessions',
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
