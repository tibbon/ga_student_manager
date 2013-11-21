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

require 'spec_helper'

describe Assignment do
  it { should belong_to :course }
  it { should have_many :contributions}
  it { should have_many(:users).through :contributions}
end
