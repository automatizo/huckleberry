class CreateHuckleberryMinerals < ActiveRecord::Migration
  def change
    create_table :huckleberry_minerals do |t|
      t.string :nutrient_databank_number, null: false, index: true
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
  end
end
