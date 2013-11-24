class AddGithubIdToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :github_id, :integer, unique: true
  end
end
