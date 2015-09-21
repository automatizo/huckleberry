require "spec_helper"

describe Huckleberry::Import::Nutrients do
  let(:importer) { described_class.new("spec/support/sr27") }

  describe "#import" do
    before { importer.import }

    it { expect(Huckleberry::Calorie.count).to eq(1) }
    it { expect(Huckleberry::Fat.count).to eq(1) }
    it { expect(Huckleberry::Carbohydrate.count).to eq(1) }
    it { expect(Huckleberry::Protein.count).to eq(1) }
    it { expect(Huckleberry::Mineral.count).to eq(1) }
    it { expect(Huckleberry::Vitamin.count).to eq(1) }
    it { expect(Huckleberry::Sterol.count).to eq(1) }
  end
end
