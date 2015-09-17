require "faraday"
require "active_record"
require "huckleberry/version"
require "huckleberry/importer"
require "huckleberry/ingredient"
require "huckleberry/calorie"
require "huckleberry/fat"
require "huckleberry/carbohydrate"
require "huckleberry/mineral"
require "huckleberry/import/base"
require "huckleberry/import/downloader"
require "huckleberry/import/ingredients"
require "huckleberry/import/nutrients"
require "huckleberry/engine" if defined?(Rails)
require "huckleberry/railtie" if defined?(Rails)

module Huckleberry
  # Your code goes here...
end
