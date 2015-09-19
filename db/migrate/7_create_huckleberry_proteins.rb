class CreateHuckleberryProteins < ActiveRecord::Migration
  def change
    create_table :huckleberry_proteins do |t|
      t.string :nutrient_databank_number, null: false, index: true
      t.float :total_protein
    end
  end
end
