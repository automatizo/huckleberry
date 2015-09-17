class CreateHuckleberryCarbohydrates < ActiveRecord::Migration
  def change
    create_table :huckleberry_carbohydrates do |t|
      t.string :nutrient_databank_number, null: false, index: true
      t.float :total_carbohydrate
      t.float :dietary_fiber
      t.float :starch
      t.float :sugar
      t.float :glucose
      t.float :sucrose
      t.float :fructose
      t.float :lactose
    end
  end
end
