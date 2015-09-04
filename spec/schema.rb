ActiveRecord::Schema.define do
  self.verbose = false

  create_table :huckleberry_ingredients, force: true, primary_key: :nutrient_databank_number, id: false do |t|
    t.string :nutrient_databank_number, null: false, index: true, unique: true
    t.string :name, null: false
  end

  create_table :huckleberry_calories do |t|
    t.string :nutrient_databank_number, null: false, index: true, unique: true
    t.integer :calories, null: false
  end
end
