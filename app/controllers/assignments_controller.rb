class AssignmentsController < ApplicationController
		
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

	def show 
		@assignment = Assignment.find(params[:id])
		@assignment.contributions
	end 

	def new
	end 

	def create
	end 



end
