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
	belongs_to :user
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
