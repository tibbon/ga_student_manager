
require 'spec_helper'

describe Contribution do
  it { should belong_to :assignment }
  it { should belong_to :user}
end
