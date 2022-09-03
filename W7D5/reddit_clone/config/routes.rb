Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy]
end
