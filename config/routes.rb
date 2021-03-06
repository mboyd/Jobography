Six470::Application.routes.draw do

  match "search/results" => "search#results", :as => :results

  match "search" => "search#search", :as => :search

  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}

  resources :jobs
  
  match 'jobs/:id/json' => 'jobs#json'

  resources :users, :only => [] do
    resources :facebook_contacts, :only => [:index, :show]
  end

  get "home/home"
  
  root :to => "home#wrapper"
      
end
