require "spec_helper"

describe Huckleberry::Importer do
  let(:importer) { Huckleberry::Importer.new }

  describe "#import" do
    before do
      stub_request(:get, /.*/).to_return(body: File.read("spec/support/sr27asc.zip"))
      importer.import
    end
  end
end
