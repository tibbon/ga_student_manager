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
  has_many :assignments
	has_many :course_memberships, :dependent => :destroy
	has_many :users, :through => :course_memberships
	scope :current, -> { where('end_date > ?', Date.today).where('start_date < ?', Date.today)}

  def students
  	CourseMembership.where(course_id: self.id).where(role: 'student').map(&:user) 
  end

end

