require "rails_helper"

RSpec.describe Category, :type => :model do

  before(:all) do
    @category1 = create(:category)
  end

  it "is valid with valid attributes" do
    expect(@category1).to be_valid
  end

  it "is not valid without a title" do
    category2 = build(:category, title: "")
    expect(category2).to_not be_valid
  end

  it "is not valid with short title" do
    category2 = build(:category, title: "aa")
    expect(category2).to_not be_valid
  end

end