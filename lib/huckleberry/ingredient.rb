module Huckleberry
  class Ingredient < ActiveRecord::Base
    self.table_name = "huckleberry_ingredients"
    self.primary_key = "nutrient_databank_number"

    validates :nutrient_databank_number, presence: true, uniqueness: { allow_blank: true }
    validates :name, presence: true

    has_one :calorie, foreign_key: :nutrient_databank_number

    delegate :calories, to: :calorie
  end
end
