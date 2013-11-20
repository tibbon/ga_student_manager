class Course < ActiveRecord::Base
	has_many :course_memberships, :dependent => :destroy
	has_many :users, :through => :course_memberships, :uniq => true
	has_many :students, through: :course_memberships, :source => :student, :conditions => "course_memberships.role = 'student'" do
		def <<(student)
			CourseMembership.with_scope(:create => {:role => "student"}) {self.concat student}
		end
	end
	has_many :teachers, through: :course_memberships, :source => :teacher, :conditions => "course_memberships.role = 'teacher'" do
		def <<(teacher)
			CourseMembership.with_scope(:create => {:role => "teacher"}) {self.concat teacher}
		end
	end
	
	has_many :assignments
	# scope :current, -> { where("'start_date' < ?", Date.today) && ("'end_date' > ?", Date.today)}
 #  scope :past, -> { where("'end_date' < ?", Date.today)}
end
