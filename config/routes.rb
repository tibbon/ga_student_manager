StudentManagerApp::Application.routes.draw do
	#temp root while testing out oauth, need to change
	root 'users#show'


  #Routes for GitHub Oauth
  get '/users/callback' => 'users#callback'
  get '/sessions/:id/create' => 'sessions#create', as: 'create_user_session'
  get '/sessions/:id/destroy' => 'sessions#destroy', as: 'destroy_user_session'
  get '/users/create' => 'users#create', as: 'create_user'
  get '/users/:id' => 'users#show', as: 'user' #have basic method in place for this now, but we need to refine the view & method
end
