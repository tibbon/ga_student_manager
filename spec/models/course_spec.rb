# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  session    :string(255)
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Course do
  it { should have_many :course_memberships }
  it { should have_many(:users).through :course_memberships }
  it { should have_many :assignments }
end
