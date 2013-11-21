StudentManagerApp::Application.routes.draw do
	#temp root while testing out oauth, need to change
	root 'users#index'


  #Routes for GitHub Oauth
  get '/users/callback' => 'users#callback'
  get '/sessions/:id/create' => 'sessions#create', as: 'create_user_session'
  get '/sessions/:id/destroy' => 'sessions#destroy', as: 'destroy_user_session'
  get '/users/create' => 'users#create', as: 'create_user'
  get '/users/:id' => 'users#show', as: 'user' #have basic method in place for this now, but we need to refine the view & method
end








#== Route Map
# Generated on 21 Nov 2013 16:06
#
#                 root GET /                               users#index
#       users_callback GET /users/callback(.:format)       users#callback
#  create_user_session GET /sessions/:id/create(.:format)  sessions#create
# destroy_user_session GET /sessions/:id/destroy(.:format) sessions#destroy
#          create_user GET /users/create(.:format)         users#create
#                 user GET /users/:id(.:format)            users#show
