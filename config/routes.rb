Rails.application.routes.draw do

  resources :profiles, only: [:index, :edit, :show, :update] do
    resources :reviews
    resources :contacts, only: [:new, :create]
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get "professional/register" =>"registrations#professional_register"
    get "user/choose" => "registrations#choose"
  end

  resources :projects do
    # member do
    #   put "like" => "projects#upvote"
    # end
    resources :project_attachments, only: [:show]
  end

  #root 'projects#index'

  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end

  root 'prehome#index'
  # get '*path' => redirect('/')

  #Additional Pages for sorting out projects and professional
    #Projects
    match 'commercials' => 'projects#commercials', :via => :get
    match 'residentials' => 'projects#residentials', :via => :get
    match 'offices' => 'projects#offices', :via => :get

    #Profile
    match 'professional/architects' => 'profiles#architects', :via => :get
    match 'professional/intdesigner' => 'profiles#interior_designers', :via => :get
    match 'professional/architect-firms' => 'profiles#architect_firms', :via => :get
    match 'professional/intdesigner-firms' => 'profiles#architect_firms', :via => :get
    match 'professional/design-firms' => 'profiles#design_firms', :via => :get
    match 'professional/land-architects' => 'profiles#land_architects', :via => :get
    match 'professional/gen-contractors' => 'profiles#gen_contractors', :via => :get
  
end
