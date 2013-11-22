class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.boolean :is_admin, default: false
	   	t.string  :telephone
	    t.string  :email, :null => false, :default => ""
	    t.text  :street_address
	    t.string  :city
	    t.string  :state
	    t.string  :zip_code
    	t.string :emergency_contact
    	t.string :emergency_contact_phone
    	t.string   :github_url
	    t.string   :html_url
	    t.string   :repos_url
	    t.string   :gists_url
	    t.string   :avatar_url
	    t.integer  :public_repos
	    t.integer  :followers
	    t.integer  :following
	    t.integer  :github_id
	    t.string   :github_login
	    t.integer  :gravatar_id
	    t.string   :followers_url
	    t.string   :following_url
	    t.string   :starred_url
	    t.string   :subscriptions_url
	    t.string   :organizations_url
	    t.string   :events_url
	    t.string   :received_events_url
	    t.string   :type
	    t.string   :site_admin
	    t.string   :public_gists
	    t.datetime :created_github_profile
	    t.datetime :last_updated_github_at
	    t.timestamps
    end
  end
end
