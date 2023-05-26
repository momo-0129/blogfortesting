Rails.application.routes.draw do
  resources :comments
  root "pages#index"
  get "about", to: "pages#about"

  resources :articles do
    resources :comments, only: [:create]
  end

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
