class CreateStudentAssignments < ActiveRecord::Migration
  def change
    create_table :student_assignments do |t|

    	t.boolean :finished 
    	t.string :repo_fork
    	t.string :travis_data
    	t.belongs_to :assignment
    	t.belongs_to :user
    	t.timestamps
    end

    add_index :student_assignments, :assignment_id
    add_index :student_assignments, :user_id

  end
end
