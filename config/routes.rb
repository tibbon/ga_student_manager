StudentManagerApp::Application.routes.draw do
  #devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
	root 'main#index'
	resources :users
	resources :assignments
	resources :contributions
	resources :courses
	resources :one_on_ones
end
