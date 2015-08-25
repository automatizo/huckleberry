ActiveRecord::Schema.define version: 0 do
  create_table :huckleberry_ingredients, force: true, primary_key: :nutrient_databank_number, id: false do |t|
    t.string :nutrient_database_number, null: false, index: true, unique: true
    t.string :name, null: false
  end
end
