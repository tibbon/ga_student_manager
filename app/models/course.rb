class Course < ActiveRecord::Base
	has_many :course_memberships
	has_many :users, through: :course_memberships
	has_many :assignments
	scope :current, -> { where("'start_date' < ?", Date.today) && ("'end_date' > ?", Date.today)}
  scope :past, -> { where("'end_date' < ?", Date.today)}

end
