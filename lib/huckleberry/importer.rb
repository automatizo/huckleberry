module Huckleberry
  class Importer
    attr_reader :directory, :version

    def initialize(directory = "tmp/usda", version = "sr27")
      @directory = directory
      @version = version
    end

    def import
      downloader.download_and_unzip
      importer_names.each { |importer_name| importer_for(importer_name).import }
    ensure
      downloader.cleanup
    end

    private

    def importer_names
      [ "Ingredients", "Nutrients" ]
    end

    def importer_for(importer_name)
      "Huckleberry::Import::#{importer_name}".constantize.new("#{directory}/#{version}")
    end

    def downloader
      Huckleberry::Import::Downloader.new(directory, version)
    end
  end
end
