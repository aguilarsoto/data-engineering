DataEngineering::Application.routes.draw do
  
  resources :uploads

  root :to => 'uploads#new'
end
