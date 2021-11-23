Rails.application.routes.draw do
  devise_for :users

  resources :contacts, only: %i[index]
  resources :failed_contacts, only: %i[index]
  
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
