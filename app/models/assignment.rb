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
	
	def quiz
		self.assignment_type == "quiz"
	end

	def homework
		self.assignment_type == "homework"
	end

	def project
		self.assignment_type == "project"
	end

end
