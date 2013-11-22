# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  first_name              :string(255)
#  last_name               :string(255)
#  is_admin                :boolean          default(FALSE)
#  telephone               :string(255)
#  email                   :string(255)
#  street_address          :text
#  city                    :string(255)
#  state                   :string(255)
#  zip_code                :string(255)
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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, omniauth_providers: [:github]

  has_many :course_memberships, :dependent => :destroy
  has_many :courses, through: :course_memberships
	has_many :contributions
  has_many :assignments, through: :contributions

  def role
    CourseMembership.where(user_id: self.id).take.role
  end

  def self.find_for_oauth(auth)
    record = where(provider: auth.provider, uid: auth.uid.to_s).first
    binding.pry
    record || create( provider: auth.provider, 
                      first_name: auth.info.name.split(' ').first,
                      last_name: auth.info.name.split(' ').last,
                      uid: auth.uid, 
                      github_url: auth.extra.raw_info.url,
                      repos_url: auth.extra.raw_info.repos_url,
                      gists_url: auth.extra.raw_info.repos_url,
                      html_url: auth.extra.raw_info.html_url,
                      avatar_url: auth.extra.raw_info.avatar_url,
                      followers: auth.extra.raw_info.followers,
                      following: auth.extra.raw_info.following,
                      github_id: auth.extra.raw_info["id"],
                      github_login: auth.extra.raw_info.login,
                      gravatar_id: auth.extra.raw_info.gravatar_id,
                      followers_url: auth.extra.raw_info.followers_url,
                      following_url: auth.extra.raw_info.following_url,
                      subscriptions_url: auth.extra.raw_info.subscriptions_url,
                      organizations_url: auth.extra.raw_info.organizations_url,
                      events_url: auth.extra.raw_info.events_url,
                      received_events_url: auth.extra.raw_info.received_events_url,
                      type: auth.extra.raw_info.type,
                      public_gists: auth.extra.raw_info.public_gists,
                      public_gists: auth.extra.raw_info.public_gists,
                      site_admin: auth.extra.raw_info.site_admin,
                      starred_url: auth.extra.raw_info.starred_url,
                      public_repos: auth.extra.raw_info.public_repos,
                      created_github_profile: auth.extra.raw_info.created_at,
                      last_updated_github_at: auth.extra.raw_info.updated_at,
                      biography: auth.extra.raw_info.bio,
                      email: auth.info.email, 
                      password: Devise.friendly_token[0,20])
  end
end
