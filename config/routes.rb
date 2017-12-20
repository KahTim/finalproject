Rails.application.routes.draw do
  get 'braintree/new'

  get 'home/index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :edit, :update, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :listings, controller: "listings" do 
    resources :reservations, only: [:create, :new]
  end 
  resources :reservations, only: [:destroy]


  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/listing/management_property" => "listings#management_property"
	get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  post 'braintree/checkout'
	root 'home#index'
end
