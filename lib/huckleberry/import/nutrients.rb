module Huckleberry
  module Import
    class Nutrients < Base
      private

      def build_object(row)
        find_or_initialize(row).tap do |object|
          relevant_rows = nutrient_names.find_all { |n| n[0] == row[1].to_i }
          relevant_rows.each do |k, v|
            # TODO: Add multiplier to value using method below.
            object.send(:nutrient_databank_number=, row[0])
            object.send("#{v}=", row[2])
          end
        end
      end

      def find_or_initialize(row)
        if nutrient_type(row)
          "Huckleberry::#{nutrient_type(row)}".constantize.find_or_initialize_by(nutrient_databank_number: row[0])
        end
      end

      def filename
        "NUT_DATA.txt"
      end

      def nutrient_type(row)
        nutrient_type = nutrient_categories.find { |c| c[1].include?(row[1].to_i) }
        if nutrient_type
          nutrient_type[0].to_s.capitalize
        end
      end

      # Returns name given ID
      def nutrient_name(id)
        nutrient_names[id]
      end

      # This is the basis for sub-class of Ingredient
      # TODO: Finish adding all data points needed.
      def nutrient_categories
        {
          calorie: [268],
          # fat: [],
          # carbohydrate: [],
          # protein: [],
          # sterol: [],
          # vitamin: [],
          # mineral: []
        }
      end

      # TODO: Finish adding all data points needed.
      # TODO: Create migrations for all of these.
      def nutrient_names
        {
          268 => :calories, 203 => "total_protein", 204 => "total_fat",
          291 => "total_fiber", 269 => "total_sugar", 205 => "total_carbohydrate",
          210 => "sucrose", 211 => "glucose", 212 => "fructose",
          213 => "lactose", 214 => "maltose", 287 => "galactose",
          209 => "starch", 301 => "calcium", 303 => "iron",
          304 => "magnesium", 305 => "phosphorus", 306 => "potassium",
          307 => "sodium", 309 => "zinc", 312 => "copper",
          315 => "manganese", 317 => "selenium", 313 => "fluoride",
          401 => "vitamin_c", 404 => "thiamin", 405 => "riboflavin",
        }
      end

      def nutrient_multiplier

      end
    end
  end
end
