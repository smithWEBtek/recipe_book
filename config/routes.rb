Rails.application.routes.draw do
    get '/search' => 'recipes#search'
    get 'recipes_find_newest' => 'recipes#find_newest'
    get 'recipes_find_quickest' => 'recipes#find_quickest'
    get 'recipes_most_ingredients' => 'recipes#most_ingredients'
    get 'recipes_least_ingredients' => 'recipes#least_ingredients'


root to: 'users#welcome'
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  





  	resources :users


  	resources :recipes do
  		resources :ingredients
  	end
end


