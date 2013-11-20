require 'spec_helper'

describe Course do
  it { should have_many :course_memberships }
  it { should have_many(:users).through :course_memberships }
  it { should have_many :assignments }
end