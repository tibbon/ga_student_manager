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

	has_many :course_memberships, :dependent => :destroy
	has_many :courses, through: :course_memberships
	has_many :contributions
	has_many :assignments, through: :contributions
  
  # # returns a list of all students ever, maybe not necessary. 
  # # also namespace conflict with the more useful class method that 
  # # takes an argument and returns the students for a specific course.
  # scope :students, -> { includes(:course_memberships).where('role = (?)', 'student').references(:course_memberships)}
  # scope :teachers, -> { includes(:course_memberships).where('role = (?)', 'teacher').references(:course_memberships)}
  
  # TODO; maybe we should have a separate github profile table for users so the users table has fewer columns <-- great advice from Tom

  def self.students(course)
    course.students
  end

  def self.teachers(course)
    course.teachers
  end

  def homeworks
    self.contributions.homework
  end

  def quizzes
    self.contributions.quiz
  end

  def projects
    self.contributions.project
  end

  def role
    self.course_memberships.current.take.role
  end

  def student?
    self.course_memberships.current.take.role == 'student'
  end

  def teacher?
    self.course_memberships.current.take.role == 'teacher'
  end

  def course
    CourseMembership.current.where(user_id: self.id).take.course
  end

  def students
    if self.teacher?
      self.course.students
    end
  end

end
