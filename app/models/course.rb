class Course < ActiveRecord::Base
	has_many :course_memberships, :dependent => :destroy
	has_many :users, :through => :course_memberships


	has_many :students, -> {where :course_memberships.role => 'student'}, class_name: 'User' 
	has_many :teachers, -> {where :course_memberships.role => 'teacher'}, class_name: 'User' 
	
	has_many :assignments
	# scope :current, -> { where("'start_date' < ?", Date.today) && ("'end_date' > ?", Date.today)}
  # scope :past, -> { where("'end_date' < ?", Date.today)}
