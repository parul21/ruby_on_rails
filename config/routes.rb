Rails.application.routes.draw do
  
  devise_for :users

  resources :movies do
  	resources :reviews, except: [:show, :index] do 
  		collection do
  			post 'movie/:id/review/create ', to: "reviews#create"
  		end
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'
end
