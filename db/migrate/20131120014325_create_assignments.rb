class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.belongs_to :course 
    	t.string :name 
    	t.string :repo_url 
    	t.datetime :due_date
    	t.string :kind
    	t.timestamps
    end
  end
end
