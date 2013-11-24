# == Schema Information
#
# Table name: assignments
#
#  id              :integer          not null, primary key
#  course_id       :integer
#  title           :string(255)
#  description     :text
#  github_login    :string(255)
#  github_repo     :string(255)
#  due_date        :datetime
#  assignment_type :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Assignment < ActiveRecord::Base
	belongs_to :course
	has_many :contributions
	has_many :users, through: :contributions
	validates_inclusion_of :assignment_type, :in => %w[quiz homework project]
	delegate :students, :to => :course , :prefix => true
	after_create :create_contributions

	def quiz
		self.assignment_type == "quiz"
	end

	def homework
		self.assignment_type == "homework"
	end

	def project
		self.assignment_type == "project"
	end

	def students 
		self.course_students
	end 

	def create_contributions
		self.students.each do |student|
			Contribution.create( user: student , assignment: self )
		end 
	end 

	def check_for_pull_requests
		pull_requests = HTTParty.get("https://api.github.com/repos/#{github_repo}/pulls")
		pull_requests.each do |pr|
			#binding.pry
			user = User.where(github_login: (pr["user"]["login"]).first)
			contribution = Contribution.where( assignment: self, user: user)
			contribution.update_from_pull_request(pr)
		end
	end
end
