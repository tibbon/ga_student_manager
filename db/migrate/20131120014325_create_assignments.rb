class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.belongs_to :course 
    	t.string :name 
    	t.string :repo_url 
    	t.datetime :due_date
<<<<<<< HEAD
    	t.boolean :project
        t.boolean :homework
        t.boolean :quiz
=======
    	t.string :assignment_type
>>>>>>> 4e73e0d6e296f451d972a3c3886fbd68c9dba1e7
    	t.timestamps
    end
  end
end
