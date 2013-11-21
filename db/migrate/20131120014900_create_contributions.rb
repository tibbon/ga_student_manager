class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|

    	t.boolean :finished 
    	t.string :repo_fork
    	t.string :travis_data
    	t.belongs_to :assignment
    	t.belongs_to :user
        t.string :url
        t.string :status
    	t.timestamps
    end

    add_index :contributions, :assignment_id
    add_index :contributions, :user_id

  end
end
