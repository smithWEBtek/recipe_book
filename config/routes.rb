Rails.application.routes.draw do
    root 'users#welcome'
    get '/signin' => 'sessions#new'
    post '/sessions' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'
  	delete '/recipes' => 'recipes#destroy'
    post '/search' => 'ingredients#search'


  	resources :users


  	resources :recipes do
  		resources :ingredients, only: [:index, :show]
  	end
  	resources :ingredients
end
