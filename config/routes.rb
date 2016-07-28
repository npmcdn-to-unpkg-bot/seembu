Rails.application.routes.draw do

  resources :profiles, only: [ :edit, :show, :update]

  devise_for :users
  resources :projects

  #root 'projects#index'

  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end

  root 'prehome#index'
  get '*path' => redirect('/')

  resources :contacts, only: [ :new, :create ]
  
end
