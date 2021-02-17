require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'deviseユーザー登録' do
     it "email、passwordとpassword_confirmationが存在すれば登録できること" do
       user = build(:user)
       # binding.pry
       expect(user).to be_valid  # user.valid? が true になればパスする
     end
end
end
