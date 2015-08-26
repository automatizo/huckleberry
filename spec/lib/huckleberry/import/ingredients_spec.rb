require "spec_helper"

describe Huckleberry::Import::Ingredients do
  let(:importer) { described_class.new("spec/support/sr27") }

  describe "#import" do
    before { importer.import }

    it { expect(Huckleberry::Ingredient.count).to eql(5) }
  end
end
