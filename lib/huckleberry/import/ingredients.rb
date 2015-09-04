module Huckleberry
  module Import
    class Ingredients < Base
      private

      def build_object(row)
        find_or_initialize(row).tap do |object|
          columns.each do |k, v|
            object.send("#{k}=", row[v])
          end
        end
      end

      def apply_typecasts(row)
        row[6] = row[6].present?
        row
      end

      def find_or_initialize(row)
        Huckleberry::Ingredient.find_or_initialize_by(nutrient_databank_number: row[0])
      end

      def filename
        "FOOD_DES.txt"
      end

      def columns
        { nutrient_databank_number: 0, name: 2 }
      end
    end
  end
end
