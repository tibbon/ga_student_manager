# == Schema Information
#
# Table name: contributions
#
#  id            :integer          not null, primary key
#  finished      :boolean
#  repo_fork     :string(255)
#  travis_data   :string(255)
#  assignment_id :integer
#  user_id       :integer
#  url           :string(255)
#  status        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Contribution < ActiveRecord::Base
	belongs_to :assignment
	belongs_to :user
	scope :homework, -> { includes(:assignment).where('assignment_type = (?)', 'homework').references(:assignment).order('due_date DESC')}
	scope :quiz, -> { includes(:assignment).where('assignment_type = (?)', 'quiz').references(:assignment).order('due_date DESC')}
	scope :project, -> { includes(:assignment).where('assignment_type = (?)', 'project').references(:assignment).order('due_date DESC')}
	delegate :assignment_type, :due_date, to: :assignment, prefix: true



	def update_from_pull_request(pr)
		contribution.github_id = pr["id"]
		contribution.url = pr["html_url"]
		contribution.repo_fork = pr["head"]["repo"]["html_url"]
		contribution.created_at = pr["created_at"]
		contribution.updated_at = pr["updated_at"]
		contribution.save
	end


end
