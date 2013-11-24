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

	def edit
	end 

	def update
	end 

private 

  def set_assignement
  	@assignment = Assignment.find(params[:id])
  end 

  def assignment_params
    params.require(:assignment).permit(:github_login, :course_id,:title, :github_repo, :due_date, :assignment_type, :description, :title) 
  end 

end
