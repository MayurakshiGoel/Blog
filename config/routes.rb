Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end

  resources :comments do
      resources :replies 
  end


  
  get '/register', to: 'users#new'
 
  resources :users, only: [:create]

  root to: "sessions#new"
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  resource :sessions, only: [:create]
end
