require 'spec_helper'

describe StudentAssignment do
  it { should belong_to :user }
  it { should belong_to :assignment }
end