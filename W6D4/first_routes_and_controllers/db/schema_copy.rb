
ActiveRecord::Schema[7.0].define(version: 2022_08_25_142409) do
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
  
    create_table "users", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "username", null: false
    end
  
  end
  