Rails.application.routes.draw do
  resources :meals, except: :destroy

  # log in page with form:
	get '/login'     => 'sessions#new'

	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'

	# delete action to log out:
	delete '/logout' => 'sessions#destroy'

  root 'meals#index'
end
