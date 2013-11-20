require 'spec_helper'

describe CourseMembership do
  it { should belong_to :user }
  it { should belong_to :course }
end