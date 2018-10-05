Rails.application.routes.draw do
    root 'users#welcome'
    get '/signin' => 'sessions#new'
    post '/sessions' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'
    get '/search' => 'ingredients#search'
    post '/search_recipes' => 'ingredients#search_recipes'




  	resources :users


  	resources :recipes do
  		resources :ingredients
  	end
end


