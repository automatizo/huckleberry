require "spec_helper"

describe Huckleberry::Importer do
  let(:importer) { Huckleberry::Importer.new }

  describe "#import" do
    before do
      stub_request(:head, "https://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR27/dnload/sr27asc.zip").
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Faraday v0.9.1'}).
        to_return(status: 200, body: "", headers: {})
      stub_request(:get, /.*/).to_return(body: File.read("spec/support/sr27asc.zip"))
      importer.import
    end

    it "should import the correct number of records" do
      expect(Huckleberry::Ingredient.count).to eq(5)
      expect(Huckleberry::Calorie.count).to eq(1)
    end

    context "importing twice" do
      before { importer.import }

      it "should import the correct number of records" do
        expect(Huckleberry::Ingredient.count).to eq(5)
        expect(Huckleberry::Calorie.count).to eq(1)
      end
    end
  end
end
