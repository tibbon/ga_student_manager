class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.belongs_to :course 
    	t.string :name 
    	t.string :repo_url 
    	t.datetime :due_date
    	t.boolean :project
        t.boolean :homework
        t.boolean :quiz
    	t.timestamps
    end
  end
end
