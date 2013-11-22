class AssignmentsController < ApplicationController
	
	def show 
		@assignment = Assignment.where(params[:id])
	end 



	
end
