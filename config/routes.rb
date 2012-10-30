FacebookDemo::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'users/sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  resources :users
  root :to => "home#index"
  
end