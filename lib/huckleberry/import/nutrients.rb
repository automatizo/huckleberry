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
          fat: [204, 606, 645, 646, 851, 629, 631, 621, 601, 605, 852, 675, 685, 672, 853, 855],
          carbohydrate: [205, 291, 209, 269, 211, 210, 212, 213],
          # protein: [],
          # sterol: [],
          vitamin: [318, 401, 324, 323, 430, 404, 405, 406, 415, 417, 418, 410, 421, 454],
          mineral: [301, 303, 304, 305, 306, 307, 309, 312, 315, 317, 313]
        }
      end

      # TODO: Finish adding all data points needed.
      # TODO: Create migrations for all of these.
      def columns
        {
          calories: 208, total_fat: 204, saturated_fat: 606,
          monounsaturated_fat: 645, polyunsaturated_fat: 646,
          omega_3_ala: 851, omega_3_epa: 629, omega_3_dpa: 631,
          omega_3_dha: 621, omega_3_other: 852, omega_6_1: 675,
          omega_6_2: 685, omega_6_3: 672, omega_6_4: 853, omega_6_5: 855,
          cholesterol: 601, trans_fat: 605, total_carbohydrate: 205,
          dietary_fiber: 291, starch: 209, sugar: 269, glucose: 211,
          sucrose: 210, fructose: 212, lactose: 213, calcium: 301,
          iron: 303, magnesium: 304, phosphorus: 305, potassium: 306,
          sodium: 307, zinc: 309, copper: 312, manganese: 315,
          selenium: 317, flouride: 313, vitamin_a: 318, vitamin_c: 401,
          vitamin_d: 324, vitamin_e: 323, vitamin_k: 430, thiamin: 404,
          riboflavin: 405, niacin: 406, vitamin_b6: 415, folate: 417,
          vitamin_b12: 418, pantothenic_acid: 410, choline: 421,
          betaine: 454
        }
      end
    end
  end
end
