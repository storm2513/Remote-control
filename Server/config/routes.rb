Rails.application.routes.draw do
  namespace :admin do
    resources :databases
  end
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :devices
	namespace :api, defaults: { format: :json } do
	  resources :devices
	  resources :users
	  resources :databases
  end

  namespace :admin do
  	get "/" => "admins#index"
  	root to: "admins#index"
  	get "/history" => "logs#index"
  	post "/devices/:id" => "devices#change"
	  resources :devices
	  resources :users
  end


   root to: "main#index"
   get "/" => "main#index"
   # get "/api" => "main#api"
   get "/users/show" => "users#show"
   get "/activate" => "users#activate"
   get '/users/:id', :to => 'users#show', :as => :user
   post "/devices/:id" => "devices#change"
   get "/history" => "logs#index"
   get "/history/destroy" => "logs#destroy"

end
