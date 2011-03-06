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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110306202216) do

  create_table "answers", :force => true do |t|
    t.string   "content"
    t.integer  "problem_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["problem_id", "content"], :name => "index_answers_on_problem_id_and_content", :unique => true
  add_index "answers", ["problem_id"], :name => "index_answers_on_problem_id"

  create_table "problems", :force => true do |t|
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "problems", ["question"], :name => "index_problems_on_question", :unique => true

end
