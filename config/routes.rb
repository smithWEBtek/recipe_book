Rails.application.routes.draw do
	root 'users#welcome'
	get '/signin' => 'sessions#new'
  	post '/sessions' => 'sessions#create'
  	delete '/sessions' => 'sessions#destroy'
    resources :options
    resources :recipes


  	resources :users do
  		resources :recipes 
  	end
end
