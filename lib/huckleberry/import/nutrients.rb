module Huckleberry
  module Import
    class Nutrients < Base
      private

      def build_object(row)
        if tracked?(row)
          find_or_initialize(row).tap do |object|
            column = columns.find { |n| n[1] == row[1].to_i }
            object.send("#{column[0]}=", row[2])
          end
        end
      end

      def find_or_initialize(row)
        "Huckleberry::#{nutrient_type(row)}".constantize.find_or_initialize_by(nutrient_databank_number: row[0])
      end

      def filename
        "NUT_DATA.txt"
      end

      def tracked?(row)
        true if columns.has_value?(row[1].to_i)
      end

      def nutrient_type(row)
        nutrient_type = nutrient_categories.find { |c| c[1].include?(row[1].to_i) }
        if nutrient_type
          nutrient_type[0].to_s.capitalize
        end
      end

      # TODO: Finish adding all data points needed.
      def nutrient_categories
        {
          calorie: [208],
          # fat: [204, 606, 645, 646],
          # carbohydrate: [],
          # protein: [],
          # sterol: [],
          # vitamin: [],
          # mineral: []
        }
      end

      # TODO: Finish adding all data points needed.
      # TODO: Create migrations for all of these.
      def columns
        {
          calories: 208
        }
        # 203 => "total_protein", 204 => "total_fat",
        # 291 => "total_fiber", 269 => "total_sugar", 205 => "total_carbohydrate",
        # 210 => "sucrose", 211 => "glucose", 212 => "fructose",
        # 213 => "lactose", 214 => "maltose", 287 => "galactose",
        # 209 => "starch", 301 => "calcium", 303 => "iron",
        # 304 => "magnesium", 305 => "phosphorus", 306 => "potassium",
        # 307 => "sodium", 309 => "zinc", 312 => "copper",
        # 315 => "manganese", 317 => "selenium", 313 => "fluoride",
        # 401 => "vitamin_c", 404 => "thiamin", 405 => "riboflavin"
      end
    end
  end
end
