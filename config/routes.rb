FacebookDemo::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  #devise_scope :user do
  #  get 'users/sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #  get 'users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  #end
  scope "(:locale)" do
  devise_for :users, 
    :controllers => { 
      :sessions           => 'devise/sessions', 
      :registrations      => 'devise/registrations', 
      :confirmations      => 'devise/confirmations', 
      :passwords          => 'devise/passwords',
      :omniauth_callbacks => 'users/omniauth_callbacks'
    },
    :path => '',
    :path_names => {:sign_in => 'users/sign_in', :sign_out => 'users/sign_out', :sign_up => 'users/sign_up'}
end
  resources :users
  root :to => "home#index"
  
end