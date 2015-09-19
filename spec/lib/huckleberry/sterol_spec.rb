require "spec_helper"

describe Huckleberry::Sterol do
  it { should validate_presence_of(:nutrient_databank_number) }
  it { should belong_to(:ingredient) }
end
