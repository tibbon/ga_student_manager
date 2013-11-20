# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  first_name              :string(255)
#  last_name               :string(255)
#  is_admin                :boolean
#  telephone               :string(255)
#  address                 :text
#  email                   :string(255)
#  emergency_contact       :string(255)
#  emergency_contact_phone :string(255)
#  github_url              :string(255)
#  html_url                :string(255)
#  repos_url               :string(255)
#  gists_url               :string(255)
#  avatar_url              :string(255)
#  public_repos            :integer
#  followers               :integer
#  following               :integer
#  github_id               :integer
#  github_login            :string(255)
#  gravatar_id             :integer
#  followers_url           :string(255)
#  following_url           :string(255)
#  starred_url             :string(255)
#  subscriptions_url       :string(255)
#  organizations_url       :string(255)
#  events_url              :string(255)
#  received_events_url     :string(255)
#  type                    :string(255)
#  site_admin              :string(255)
#  public_gists            :string(255)
#  created_github_profile  :datetime
#  last_updated_github_at  :datetime
#  created_at              :datetime
#  updated_at              :datetime
#

require 'spec_helper'

describe User do
  it { should have_many :course_memberships }
  it { should have_many :student_assignments }
  it { should have_many(:courses).through :course_memberships }
  it { should have_many(:assignments).through :student_assignments }
end
