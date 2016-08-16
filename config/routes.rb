Rails.application.routes.draw do




  resources :profiles, only: [:index, :edit, :show, :update] do
    resources :reviews
    resources :contacts, only: [:new, :create]
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :projects

  #root 'projects#index'

  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end

  root 'prehome#index'
  get '*path' => redirect('/')

  #Additional Pages for sorting out projects and professional
    #Projects
    match 'commercials' => 'projects#commercials', :via => :get
    match 'residentials' => 'projects#residentials', :via => :get
    match 'offices' => 'projects#offices', :via => :get

    #Profile
    match 'professional/architects' => 'profiles#architects', :via => :get
    match 'professional/intdesigner' => 'profiles#interior_designers', :via => :get
  
end
