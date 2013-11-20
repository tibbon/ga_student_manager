class CreateCourseMembership < ActiveRecord::Migration
  def change
    create_table :course_memberships do |t|
    	t.belongs_to :user
    	t.belongs_to :course
    	t.string :role
    	t.timestamps
    end
  end
end
