DataEngineering::Application.routes.draw do
  
  devise_for :users

  resources :uploads

  root :to => 'uploads#new'
end
