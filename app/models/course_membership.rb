# == Schema Information
#
# Table name: course_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  course_id  :integer
#  role       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CourseMembership < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	scope :current, -> { includes(:course).where('end_date > ?', Date.today).where('start_date < ?', Date.today).references(:course)}
	validates_inclusion_of :role, :in => %w[teacher student]
end
