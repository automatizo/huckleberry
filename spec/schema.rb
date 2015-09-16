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

  create_table :huckleberry_fats do |t|
    t.string :nutrient_databank_number, null: false, index: true, unique: true
    t.float :total_fat
    t.float :saturated_fat
    t.float :monounsaturated_fat
    t.float :polyunsaturated_fat
    t.float :omega_3_ala
    t.float :omega_3_epa
    t.float :omega_3_dpa
    t.float :omega_3_dha
    t.float :omega_3_other
    t.float :cholesterol
    t.float :trans_fat
    t.float :omega_6_1
    t.float :omega_6_2
    t.float :omega_6_3
    t.float :omega_6_4
    t.float :omega_6_5
  end
end
