Rails.application.routes.draw do
    root 'users#welcome'
    get '/signin' => 'sessions#new'
    post '/sessions' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'
  	delete '/recipes' => 'recipes#destroy'
    get '/ingredients' => 'ingredients#index'
    post '/ingredients'=> 'ingredients#find'
    get '/search' => 'ingredients#search'
    post '/search' => 'ingredients#search'




  	resources :users


  	resources :recipes do
  		resources :ingredients
  	end

end


