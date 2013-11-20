class Course < ActiveRecord::Base
	has_many :course_memberships
	has_many :students, through: :course_memberships, :source => :user, :conditions => {:course_memberships => {:role => :student}}
	has_many :teachers, through: :course_memberships, :source => :user, :conditions => {:course_memberships => {:role => :teacher}}
	has_many :assignments
	scope :current, -> { where("'start_date' < ?", Date.today) && ("'end_date' > ?", Date.today)}
  scope :past, -> { where("'end_date' < ?", Date.today)}
end
