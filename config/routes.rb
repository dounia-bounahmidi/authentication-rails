Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#welcome'
  get 'welcome' => 'pages#welcome'  
  get 'signup' => 'users#new'
  resources :users 
  get "login" => 'sessions#new'
  post "login" => 'sessions#create' 
  delete 'logout' => 'sessions#destroy' 
  get 'dashboard' => 'lists#index' 
  
  resources :lists do  
    resources :tasks do 
    member do 
     patch :complete
     end 
  end 
end 
  
end
