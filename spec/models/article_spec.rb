require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { Article.new(title: "title", description: "description")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with too short title" do
    subject.title = "bb"
    expect(subject).to_not be_valid
  end

  it "is not valid with too long title" do
    subject.title = "bb" * 300
    expect(subject).to_not be_valid
  end

  it "is not valid with too short description" do
    subject.description = "bb"
    expect(subject).to_not be_valid
  end

  it "is not valid with too long description" do
    subject.description = "bb" * 300
    expect(subject).to_not be_valid
  end

end
