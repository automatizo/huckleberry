module Huckleberry
  module Import
    class Nutrients < Base
      private

      def find_or_initialize(row)
        
      end

      def filename
        "NUT_DATA.txt"
      end

      def columns
        {
          nutrient_databank_number: 0,
          nutrient_id: 1,
          nutrient_value: 2
        }
      end

      def nutrient_ids
        {
          255 => "water"
        }
      end
    end
  end
end
