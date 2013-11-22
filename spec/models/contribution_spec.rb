# == Schema Information
#
# Table name: contributions
#
#  id            :integer          not null, primary key
#  finished      :boolean
#  repo_fork     :string(255)
#  travis_data   :string(255)
#  assignment_id :integer
#  user_id       :integer
#  url           :string(255)
#  status        :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#


require 'spec_helper'

describe Contribution do
  it { should belong_to :assignment }
  it { should belong_to :user}
end
