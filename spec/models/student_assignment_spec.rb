require 'spec_helper'

describe StudentAssignment do
  it { should belong_to :user }
  it { should bleong_to :assignment }
end