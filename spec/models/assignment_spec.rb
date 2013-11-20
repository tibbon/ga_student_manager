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

require 'spec_helper'

describe Assignment do
  it { should belong_to :course }
  it { should have_many :student_assignments }
  it { should have_many(:users).through :student_assignments }
end
