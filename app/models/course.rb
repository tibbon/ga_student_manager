# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  session    :string(255)
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Course < ActiveRecord::Base
	has_many :course_memberships, :dependent => :destroy
	has_many :users, :through => :course_memberships
	has_many :students, -> {where :course_memberships.role => 'student'}, class_name: 'User' 
	has_many :teachers, -> {where :course_memberships.role => 'teacher'}, class_name: 'User' 

	has_many :assignments
  has_many :quizzes, :class_name => "Assignment"
  has_many :homeworks, :class_name => "Assignment"
  has_many :projects, :class_name => "Assignment"
  
	# scope :current, -> { where("'start_date' < ?", Date.today) && ("'end_date' > ?", Date.today)}
  scope :past, -> { where("'end_date' < ?", Date.today)}

  def teachers
    self.users.where(:course_memberships => {:role => "teacher"})
  end

  def students
  	self.users.where(:course_memberships => {:role => "student"})
  end

end
