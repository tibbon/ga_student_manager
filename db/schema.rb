# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131120014325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: true do |t|
    t.integer  "course_id"
    t.string   "name"
    t.string   "repo_url"
    t.datetime "due_date"
    t.string   "kind"
    t.boolean  "project"
    t.boolean  "homework"
    t.boolean  "quiz"
    t.string   "assignment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_memberships", ["course_id"], name: "index_course_memberships_on_course_id", using: :btree
  add_index "course_memberships", ["user_id"], name: "index_course_memberships_on_user_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "session"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
=======
  create_table "student_assignments", force: true do |t|
    t.boolean  "finished"
    t.string   "repo_fork"
    t.string   "travis_data"
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_assignments", ["assignment_id"], name: "index_student_assignments_on_assignment_id", using: :btree
  add_index "student_assignments", ["user_id"], name: "index_student_assignments_on_user_id", using: :btree

>>>>>>> 054eb87d309e8806f291582e0ead3083ae916604
  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_admin"
    t.string   "telephone"
    t.text     "address"
    t.string   "email"
    t.string   "emergency_contact"
    t.string   "emergency_contact_phone"
    t.string   "github_url"
    t.string   "html_url"
    t.string   "repos_url"
    t.string   "gists_url"
    t.string   "avatar_url"
    t.integer  "public_repos"
    t.integer  "followers"
    t.integer  "following"
    t.integer  "github_id"
    t.string   "github_login"
    t.integer  "gravatar_id"
    t.string   "followers_url"
    t.string   "following_url"
    t.string   "starred_url"
    t.string   "subscriptions_url"
    t.string   "organizations_url"
    t.string   "events_url"
    t.string   "received_events_url"
    t.string   "type"
    t.string   "site_admin"
    t.string   "public_gists"
    t.datetime "created_github_profile"
    t.datetime "last_updated_github_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
