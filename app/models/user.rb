class User < ActiveRecord::Base
	has_many :course_memberships
	has_many :courses, through: :course_memberships
	has_many :assignments, through: :student_assignments
  
  def role
  	CourseMembership.current.where(user_id: self.id).role
  end

  def current_course
  	CourseMembership.current.where(user_id: self.id).course_id
  end

end
