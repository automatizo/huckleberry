require "csv"

module Huckleberry
  module Import
    class Base
      def initialize(directory)
        @directory = directory
      end

      def import
        CSV.open(file_location, "r:iso-8859-1:utf-8", csv_options) do |csv|
          csv.each { |row| extract_row(row) }
        end
      end

      private

      attr_reader :directory

      def extract_row(row)
        build_object(apply_typecasts(row)).save
      end

      def build_object(row)
        find_or_initialize(row).tap do |object|
          columns.each do |k, v|
            object.send("#{k}=", row[v])
          end
        end
      end

      def csv_options
        { col_sep: "^", quote_char: "~" }
      end

      def apply_typecasts(row)
        row
      end

      def file_location
        "#{directory}/#{filename}"
      end

      def filename
        raise NotImplementedError
      end

      def columns
        raise NotImplementedError
      end

      def find_or_initialize
        raise NotImplementedError
      end
    end
  end
end
