module Huckleberry
  class Mineral < ActiveRecord::Base
    self.table_name = "huckleberry_minerals"

    validates :nutrient_databank_number, presence: true, uniqueness: { allow_blank: true }

    belongs_to :ingredient, foreign_key: :nutrient_databank_number
  end
end
