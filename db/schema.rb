# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_29_062144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: :cascade do |t|
    t.string "feedbackable_type"
    t.bigint "feedbackable_id"
    t.string "comment"
    t.bigint "owner_id", null: false
    t.index ["feedbackable_type", "feedbackable_id"], name: "index_feedbacks_on_feedbackable"
    t.index ["owner_id"], name: "index_feedbacks_on_owner_id"
  end

  create_table "ip_addresses", force: :cascade do |t|
    t.string "ip", default: "0.0.0.0", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.integer "total_ratings", default: 0, null: false
    t.float "average_rating", default: 0.0, null: false
    t.bigint "user_id", null: false
    t.bigint "ip_address_id", null: false
    t.index ["ip_address_id"], name: "index_posts_on_ip_address_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "value", default: 1, null: false
    t.bigint "post_id", null: false
    t.index ["post_id"], name: "index_ratings_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "user_name", null: false
    t.string "encrypted_password"
    t.string "authentication_token"
  end

  add_foreign_key "feedbacks", "users", column: "owner_id"
end
