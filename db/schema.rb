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

ActiveRecord::Schema.define(version: 20170427164021) do

  create_table "landslides", force: :cascade do |t|
    t.string  "hazard_type"
    t.integer "injuries"
    t.string  "landslide_size"
    t.string  "landslide_type"
    t.decimal "latitude"
    t.string  "location_accuracy"
    t.string  "location_description"
    t.decimal "longitude"
    t.string  "near"
    t.string  "nearest_places"
    t.string  "trigger"
    t.string  "source_name"
  end

end
