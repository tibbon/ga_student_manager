class Assignment < ActiveRecord::Base
	belongs_to :course
	has_many :student_assignments
	has_many :users, through: :student_assignments
end