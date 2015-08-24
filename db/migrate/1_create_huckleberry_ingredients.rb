class CreateHuckleberryIngredients < ActiveRecord::Migration
  def change
    create_table :huckleberry_ingredients, id: false, primary_key: :nutrient_databank_number do |t|
      t.string :nutrient_databank_number, null: false, index: true
      t.string :name, null: false
    end
  end
end
