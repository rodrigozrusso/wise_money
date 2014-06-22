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

ActiveRecord::Schema.define(version: 20140620020748) do

  create_table "capitals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "capitals", ["name"], name: "index_capitals_on_name", unique: true

  create_table "transactions", force: true do |t|
    t.string   "description"
    t.integer  "status"
    t.decimal  "total"
    t.datetime "checked_at"
    t.integer  "income_capital_id"
    t.integer  "expense_capital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["expense_capital_id"], name: "index_transactions_on_expense_capital_id"
  add_index "transactions", ["income_capital_id"], name: "index_transactions_on_income_capital_id"

end
