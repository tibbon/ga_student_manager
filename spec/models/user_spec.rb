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

require 'spec_helper'

describe User do
  it { should have_many :course_memberships }
  it { should have_many(:assignments).through :contributions }
  it { should have_many :contributions }
  it { should have_many(:courses).through :course_memberships }
  
  it "has a valid factory" do
  	FactoryGirl.create(:user).should be_valid
  end
  
  it "returns a list of homeworks in an array" do
    a_student = FactoryGirl.create(:user)
    course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
    homework = Assignment.create(assignment_type: "homework")
    my_homework = Contribution.create(assignment: homework, user: a_student)
    another_homework = Assignment.create(assignment_type: "homework")
    a_quiz = Assignment.create(assignment_type: "quiz")
    my_other_homework = Contribution.create(assignment: another_homework, user: a_student)
    my_quiz = Contribution.create(assignment: a_quiz, user: a_student)
    a_student.homeworks.should =~ [my_homework, my_other_homework]
  end

  it "returns a list of quizzes in an array" do
    a_student = FactoryGirl.create(:user)
    course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
    quiz = Assignment.create(assignment_type: "quiz")
    my_quiz = Contribution.create(assignment: quiz, user: a_student)
    another_quiz = Assignment.create(assignment_type: "quiz")
    a_homework = Assignment.create(assignment_type: "homework")
    my_other_quiz = Contribution.create(assignment: another_quiz, user: a_student)
    my_homework = Contribution.create(assignment: a_homework, user: a_student)
    a_student.quizzes.should =~ [my_quiz, my_other_quiz]
  end

  it "returns a list of projects in an array" do
  	a_student = FactoryGirl.create(:user)
    course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
    project = Assignment.create(assignment_type: "project")
    my_project = Contribution.create(assignment: project, user: a_student)
    another_project = Assignment.create(assignment_type: "project")
    a_homework = Assignment.create(assignment_type: "homework")
    my_other_project = Contribution.create(assignment: another_project, user: a_student)
    my_homework = Contribution.create(assignment: a_homework, user: a_student)
    a_student.projects.should =~ [my_project, my_other_project]
  end

  it "returns its role as a string" do
  	a_student = FactoryGirl.create(:user, first_name: "Abby")
  	course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
  	student_membership = CourseMembership.create(role: "student", user_id: a_student.id, course: course)
  	a_student.role.should == "student"
    a_teacher = FactoryGirl.create(:user, first_name: "Tom")
  	teacher_membership = CourseMembership.create(role: "teacher", user: a_teacher, course: course)
  	a_teacher.role.should == "teacher"
  end

  it "responds with true when asked if it is a student" do
    a_student = FactoryGirl.create(:user, first_name: "Abby")
  	course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
  	student_membership = CourseMembership.create(role: "student", user_id: a_student.id, course: course)
  	a_student.student?.should == true
  end

  it "responds with false when a teacher is asked if they are a student" do
    a_teacher = FactoryGirl.create(:user, first_name: "Tom")
   	course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
   	teacher_membership = CourseMembership.create(role: "teacher", user: a_teacher, course: course)
  	a_teacher.student?.should == false
  end
  
  it "should consider only current course memberships when returning role info" do
    teddy = User.create(first_name: "Teddy")
    nyc_summer = Course.create(start_date: Date.today - 5.months, end_date: Date.today - 2.months)
  	teddy_enrolls = CourseMembership.create(user: teddy, course: nyc_summer, role: "student")
  	bos_fall = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
  	teddy_gets_promoted = CourseMembership.create(user: teddy, course: bos_fall, role: "teacher")
  	teddy.role.should == "teacher"
  	teddy.student?.should == false
  	teddy.teacher?.should == true
  end
    
  it "responds with true  when asked if a teacher is a teacher" do
    a_teacher = FactoryGirl.create(:user, first_name: "David")
  	course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
  	teacher_membership = CourseMembership.create(role: "teacher", user_id: a_teacher.id, course: course)
  	a_teacher.teacher?.should == true
  end

  it "responds with false when a student is asked if they are a teacher" do
    a_student = FactoryGirl.create(:user, first_name: "Tom")
   	course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
   	student_membership = CourseMembership.create(role: "student", user: a_student, course: course)
  	a_student.teacher?.should == false
  end

  it "returns its course" do
  	a_student = FactoryGirl.create(:user, first_name: "Tom")
   	course = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
    student_membership = CourseMembership.create(role: "student", user: a_student, course: course)
    a_student.course.should == course
  end

  it "returns a list of its students in an array" do
    rahul = User.create
    amal = User.create
    teddy = User.create
    tom = User.create
    wdi = Course.create(start_date: Date.today - 2.months, end_date: Date.today + 1.month)
    CourseMembership.create(user: rahul, course: wdi, role: "student")
    CourseMembership.create(user: amal, course: wdi, role: "student")
    CourseMembership.create(user: teddy, course: wdi, role: "teacher")
    CourseMembership.create(user: tom, course: wdi, role: "teacher")
    tom.students.should =~ [rahul, amal]
    teddy.students.should =~ [rahul, amal]
    rahul.students.should be nil
    amal.students.should be nil
  end
end
