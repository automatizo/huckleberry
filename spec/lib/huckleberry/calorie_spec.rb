require "spec_helper"

describe Huckleberry::Calorie do
  it { should validate_presence_of(:nutrient_databank_number) }
  it { should validate_presence_of(:calories) }
  it { should belong_to(:ingredient) }
end
