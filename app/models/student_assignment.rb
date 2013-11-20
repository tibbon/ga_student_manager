class StudentAssignment < ActiveRecord::Base
	belongs_to :student, :class_name => "User"
	belongs_to :assignment
	
end