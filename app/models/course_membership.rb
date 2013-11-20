class CourseMembership < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	belongs_to :student, :class_name => "User"
	belongs_to :teacher, :class_name => "User"
end
