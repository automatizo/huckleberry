class CreateHuckleberryCalories < ActiveRecord::Migration
  def change
    create_table :huckleberry_calories do |t|
      t.integer :calories, null: false
      t.string :nutrient_databank_number, null: false, index: true
    end
  end
end
