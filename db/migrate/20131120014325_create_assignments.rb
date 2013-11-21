class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.belongs_to :course 
    	t.string :title
        t.text :description
        t.string :github_login
        t.string :github_repo
    	t.datetime :due_date
    	t.string :assignment_type
    	t.timestamps
    end
  end
end
