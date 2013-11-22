# == Schema Information
#
# Table name: assignments
#
#  id              :integer          not null, primary key
#  course_id       :integer
#  name            :string(255)
#  repo_url        :string(255)
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
	
	def quiz
		self.assignment_type == "quiz"
	end

	def homework
		self.assignment_type == "homework"
	end

	def project
		self.assignment_type == "project"
	end


	def create_contributions
		# github_url looks like: AmalHussein/ga-string-analysis-homework, and will be input by the teacher
		pull_requests = HTTParty.get("https://api.github.com/repos/#{github_repo}/pulls")
		pull_requests.each do |pr|
			Contribution.create( assignment_id: self.id,
				github_id: pr["id"], 
				user_id: User.where(github_login: (pr["user"]["login"] || 1)).first,
				url: pr["html_url"],
				repo_fork: pr["head"]["repo"]["html_url"],
				created_at: pr["created_at"],
				updated_at: pr["updated_at"])
		end
	end
end
