require 'spec_helper'

describe User do
  it { should have_many :course_memberships }
  it { should have_many(:courses).through :course_memberships }
  it { should have_many(:assignments).through :student_assignments }
end