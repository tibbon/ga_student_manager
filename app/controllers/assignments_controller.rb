class AssignmentsController < ApplicationController
		
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  def index
  	render json: Assignment.all
  end
	def show 
		@assignment.check_for_pull_requests
	end 

	def new
		@assignment = Assignment.new
	end 

	def create
		@assignment = Assignment.new(assignment_params)
    if @assignment.save 
      redirect_to @assignment
    else 
      render action: 'new'
    end 
	end 

	def edit
	end 

	def update
	end 

private 

  def set_assignment
  	@assignment = Assignment.find(params[:id])
  end 

  def assignment_params
    params.require(:assignment).permit(:github_login, :course_id,:title, :github_repo, :due_date, :assignment_type, :description, :title) 
  end 

end
