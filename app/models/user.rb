class User < ActiveRecord::Base
	has_many :course_memberships
	has_many :courses, through: :course_memberships
	has_many :student_assignments
	has_many :assignments, through: :student_assignments

	scope :with_role, lamda{|role| includes(:course_membership).where(:course_memberships => {:role => role}) }
   # User.with_role "Student" 
  
  def role
  	CourseMembership.current.where(user_id: self.id).role
  	#self.course_membership.current.role
  end

  def current_course
  	CourseMembership.current.where(user_id: self.id).course
  end

end
