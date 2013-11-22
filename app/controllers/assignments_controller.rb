class AssignmentsController < ApplicationController
	
	def show 
		@assignment = Assignment.find(params[:id])
		@assignment.contributions
	end 

end
