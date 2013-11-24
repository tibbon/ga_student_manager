StudentManagerApp::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
	root 'users#index'
<<<<<<< HEAD
	resources :users
end
=======
	get '/assignments/:id' => 'assignments#show'

end
>>>>>>> 48ba46478832337bd4a0fb43c6966debf8cc8a0a
