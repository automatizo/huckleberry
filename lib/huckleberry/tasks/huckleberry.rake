namespace :huckleberry do
  desc "Import the latest nutrition data"
  task import: :environment do
    Huckleberry::Importer.new("tmp/usda", "sr27").import
  end
end
