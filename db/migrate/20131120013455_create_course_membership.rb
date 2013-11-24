class CreateCourseMembership < ActiveRecord::Migration
  def change
    create_table :course_memberships do |t|
    	t.belongs_to :user
    	t.belongs_to :course
    	t.string :role
    	t.timestamps
    end
    add_index :course_memberships, :user_id
    add_index :course_memberships, :course_id 
  end
end
