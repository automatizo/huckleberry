module Huckleberry
  class Fat < ActiveRecord::Base
    self.table_name = "huckleberry_fats"

    validates :nutrient_databank_number, presence: true, uniqueness: { allow_blank: true }

    belongs_to :ingredient, foreign_key: :nutrient_databank_number
  end
end
