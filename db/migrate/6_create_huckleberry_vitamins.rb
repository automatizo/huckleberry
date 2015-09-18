class CreateHuckleberryVitamins < ActiveRecord::Migration
  def change
    create_table :huckleberry_vitamins do |t|
      t.string :nutrient_databank_number, null: false, index: true
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
  end
end
