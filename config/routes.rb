Rails.application.routes.draw do
  get '/search' => 'recipes#search'
  get 'recipes_find_newest' => 'recipes#find_newest'
  get 'recipes_find_quickest' => 'recipes#find_quickest'
  get 'recipes_most_ingredients' => 'recipes#most_ingredients'


  resources :users

  root 'users#welcome'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/failure'



  
  resources :ingredients



  resources :recipes do
    resources :comments, only: [:show, :index, :new, :edit]
  end
  resources :comments, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end


