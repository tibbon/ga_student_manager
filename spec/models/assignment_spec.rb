require 'spec_helper'

describe Assignment do
  it { should belong_to :course }
  it { should have_many :student_assignments }
  it { should have_many(:users).through :student_assignments }
end