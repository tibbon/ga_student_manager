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

require 'spec_helper'

describe CourseMembership do
  it { should belong_to :user }
  it { should belong_to :course }
end
