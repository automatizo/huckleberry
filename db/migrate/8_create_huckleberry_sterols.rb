class CreateHuckleberrySterols < ActiveRecord::Migration
  def change
    create_table :huckleberry_sterols do |t|
      t.string :nutrient_databank_number, null: false, index: true
      t.float :cholesterol
      t.float :phytosterol
    end
  end
end
