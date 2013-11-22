StudentManagerApp::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
	root 'users#index'


  #Routes for GitHub Oauth - Probably don't need the below things
  # get '/users/callback' => 'users#callback'
  # get '/users/callback' => 'omni_auth_callbacks#github'
  # get '/sessions/:id/create' => 'sessions#create', as: 'create_user_session'
  # get '/sessions/:id/destroy' => 'sessions#destroy', as: 'destroy_user_session'
  # get '/users/create' => 'users#create', as: 'create_user'
  # get '/users/:id' => 'users#show', as: 'user' #have basic method in place for this now, but we need to refine the view & method
end