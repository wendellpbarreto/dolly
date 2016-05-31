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

ActiveRecord::Schema.define(version: 20160531104054) do

  create_table "actions", force: :cascade do |t|
    t.string   "title",       default: "", null: false
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "when"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friend_hashtags", force: :cascade do |t|
    t.integer  "friend_id"
    t.integer  "hashtag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friend_hashtags", ["hashtag_id"], name: "index_friend_hashtags_on_hashtag_id"

  create_table "friend_reactions", force: :cascade do |t|
    t.integer  "friend_id"
    t.integer  "reaction_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "friend_reactions", ["reaction_id"], name: "index_friend_reactions_on_reaction_id"

  create_table "friends", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "hashtag_reactions", force: :cascade do |t|
    t.integer  "hashtag_id"
    t.integer  "reaction_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hashtag_reactions", ["hashtag_id"], name: "index_hashtag_reactions_on_hashtag_id"
  add_index "hashtag_reactions", ["reaction_id"], name: "index_hashtag_reactions_on_reaction_id"

  create_table "hashtags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "action_id"
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["action_id"], name: "index_messages_on_action_id"
  add_index "messages", ["friend_id"], name: "index_messages_on_friend_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "permission_roles", force: :cascade do |t|
    t.integer  "permission_id"
    t.integer  "role_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "permission_roles", ["permission_id"], name: "index_permission_roles_on_permission_id"
  add_index "permission_roles", ["role_id"], name: "index_permission_roles_on_role_id"

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.string   "action"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "user_reactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reaction_id"
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_reactions", ["reaction_id"], name: "index_user_reactions_on_reaction_id"
  add_index "user_reactions", ["user_id"], name: "index_user_reactions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
    t.string   "fb_id"
    t.string   "fb_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
