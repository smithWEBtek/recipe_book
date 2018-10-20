Rails.application.routes.draw do
    get '/search' => 'recipes#search'
    get 'recipes_find_newest' => 'recipes#find_newest'
    get 'recipes_find_quickest' => 'recipes#find_quickest'
    get 'recipes_most_ingredients' => 'recipes#most_ingredients'


root to: 'users#welcome'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  





  	resources :users
    resources :ingredients



  	resources :recipes do
      resources :comments, :only => [:new]
    end
    resources :comments, :only => [:update, :destroy]
end


