Rails.application.routes.draw do
    root 'users#welcome'
    get '/signin' => 'sessions#new'
    post '/sessions' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'
    get '/search' => 'recipes#search'
    get 'recipes_find_newest' => 'recipes#find_newest'





  	resources :users


  	resources :recipes do
  		resources :ingredients
  	end
end


