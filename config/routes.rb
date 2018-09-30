Rails.application.routes.draw do
    root 'users#welcome'
    get '/signin' => 'sessions#new'
    post '/sessions' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'
  	delete '/recipes' => 'recipes#destroy'
    get '/ingredients' => 'ingredients#index'



  	resources :users


  	resources :recipes do
  		resources :ingredients
  	end

end


