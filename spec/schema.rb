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
    t.float :trans_fat
    t.float :omega_6_1
    t.float :omega_6_2
    t.float :omega_6_3
    t.float :omega_6_4
    t.float :omega_6_5
  end

  create_table :huckleberry_carbohydrates do |t|
    t.string :nutrient_databank_number, null: false, index: true, unique: true
    t.float :total_carbohydrate
    t.float :dietary_fiber
    t.float :starch
    t.float :sugar
    t.float :glucose
    t.float :sucrose
    t.float :fructose
    t.float :lactose
  end

  create_table :huckleberry_minerals do |t|
    t.string :nutrient_databank_number, null: false, index: true, unique: true
    t.float :calcium
    t.float :iron
    t.float :magnesium
    t.float :phosphorus
    t.float :potassium
    t.float :sodium
    t.float :zinc
    t.float :copper
    t.float :manganese
    t.float :selenium
    t.float :flouride
  end

  create_table :huckleberry_vitamins do |t|
    t.string :nutrient_databank_number, null: false, index: true, unique: true
    t.float :vitamin_a
    t.float :vitamin_c
    t.float :vitamin_d
    t.float :vitamin_e
    t.float :vitamin_k
    t.float :thiamin
    t.float :riboflavin
    t.float :niacin
    t.float :vitamin_b6
    t.float :folate
    t.float :vitamin_b12
    t.float :pantothenic_acid
    t.float :choline
    t.float :betaine
  end

  create_table :huckleberry_proteins do |t|
    t.string :nutrient_databank_number, null: false, index: true, unique: true
    t.float :total_protein
  end

  create_table :huckleberry_sterols do |t|
    t.string :nutrient_databank_number, null: false, index: true, unique: true
    t.float :cholesterol
    t.float :phytosterol
  end
end
