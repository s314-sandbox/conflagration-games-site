require "rails_helper"

RSpec.describe Article, :type => :model do

  before(:all) do
    @user1 = User.create(email: "john@doe.com", password: "woohoo")
    @category1 = Category.create(title: "Sample", game: false)
    @article1 = create(:article, category: @category1, author: @user1)
  end

  it "is valid with valid attributes" do
    expect(@article1).to be_valid
  end

  it "is not valid without a title" do
    article2 = build(:article, title: "", category: @category1, author: @user1)
    expect(article2).to_not be_valid
  end

  it "is not valid without an description" do
    article2 = build(:article, description: nil, category: @category1, author: @user1)
    expect(article2).to_not be_valid
  end

  it "is not valid with short content" do
    article2 = build(:article, contents: "a", category: @category1, author: @user1)
    expect(article2).to_not be_valid
  end

  it "is not valid without author" do
    expect(build(:article, category: @category1)).to_not be_valid
  end

end