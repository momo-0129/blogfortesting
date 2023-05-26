require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { User.new(username: "momo", email: "momo@momo.com", password: "password") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a username" do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with too short username" do
    subject.username = "bb"
    expect(subject).to_not be_valid
  end

  it "is not valid with too long username" do
    subject.username = "bb" * 300
    expect(subject).to_not be_valid
  end

  it "is not valid with too short email" do
    subject.email = "bb"
    expect(subject).to_not be_valid
  end

  it "is not valid with too long email" do
    subject.email = "bb" * 300
    expect(subject).to_not be_valid
  end

  it "username must be unique" do
    User.new(username: "momo", email: "momo@momo.com", password: "password").save
    user2 = User.new(username: "momo", email: "momo2@momo.com", password: "password").save
    expect(user2).to eq(false)
  end

  it "email must be unique" do
    User.new(username: "momo", email: "momo@momo.com", password: "password").save
    user2 = User.new(username: "momo2", email: "momo@momo.com", password: "password").save
    expect(user2).to eq(false)
  end

  it "email should be downcase" do
    user = User.new(username: "momo", email: "MOMO@MOMO.COM", password: "password")
    expect(user).to be_valid
  end

  it "email should be valid" do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    user = User.new(username: "momo", email: "momo@momo.com", password: "password")
    valid_emails.each do |valid_email|
      user.email = valid_email
      expect(user).to be_valid
    end
  end

  it "invalide mail should not be valid" do
    valid_emails = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    user = User.new(username: "momo", email: "momo@momo.com", password: "password")
    valid_emails.each do |valid_email|
      user.email = valid_email
      expect(user).to_not be_valid
    end
  end

end