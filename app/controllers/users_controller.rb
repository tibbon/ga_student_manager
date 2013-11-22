class UsersController < ApplicationController

	#need to refine/delete this show and index methods. just using for now to test the oauth and also have a view
	def index 
	end 
	
	def show
		@user = User.find(params[:id])
	end 
end
