require "spec_helper"

describe Huckleberry::Ingredient do
  it { should validate_presence_of(:nutrient_databank_number) }
  it { should validate_presence_of(:name) }
  it { should have_one(:calorie) }
  it { should have_one(:fat) }
  it { should have_one(:mineral) }
  it { should have_one(:vitamin) }
  it { should have_one(:protein) }
end
