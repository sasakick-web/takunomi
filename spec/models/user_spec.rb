require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'is valid with a email and password' do
    it "email、passwordが存在すれば登録できる" do
      user = build(:user , :a)
      # user = FactoryBot.create(:user, :a)　6行目と別な書き方
      expect(user).to be_valid
  end
end

  it "is invalid without an email" do
    user = build(:user , :b)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "is invalid without an password" do
    user = build(:user , :c)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "is invalid with a duplicate email address" do
  User.create(
    email: "test1@user.com",
    password: "user1pass",
  )
  user = User.new(
    email: "test1@user.com",
    password: "user2pass",
  )
  user.valid?
  expect(user.errors[:email]).to include("はすでに存在します")
  end
end
