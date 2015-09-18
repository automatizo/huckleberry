module Huckleberry
  class Ingredient < ActiveRecord::Base
    self.table_name = "huckleberry_ingredients"
    self.primary_key = "nutrient_databank_number"

    validates :nutrient_databank_number, presence: true, uniqueness: { allow_blank: true }
    validates :name, presence: true

    has_one :calorie, foreign_key: :nutrient_databank_number
    has_one :fat, foreign_key: :nutrient_databank_number
    has_one :mineral, foreign_key: :nutrient_databank_number
    has_one :vitamin, foreign_key: :nutrient_databank_number

    delegate :calories, to: :calorie
    delegate :total_fat, :saturated_fat, :monounsaturated_fat, :polyunsaturated_fat, :omega_3_ala, :omega_3_epa, :omega_3_dpa, :omega_3_dha, :cholesterol, :trans_fat, :omega_3_other, :omega_6_1, :omega_6_2, :omega_6_3, :omega_6_4, :omega_6_5, to: :fat
    delegate :calcium, :iron, :magnesium, :phosphorus, :potassium, :sodium, :zinc, :copper, :manganese, :selenium, :flouride, to: :mineral
    delegate :vitamin_a, :vitamin_c, :vitamin_d, :vitamin_e, :vitamin_k, :thiamin, :riboflavin, :niacin, :vitamin_b6, :folate, :vitamin_b12, :pantothenic_acid, :choline, :betaine, to: :vitamin
  end
end
