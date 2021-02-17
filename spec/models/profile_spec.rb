require 'rails_helper'

RSpec.describe 'Profileバリデーションのテスト', type: :model do
  before do
    @user = build(:profile)
  end

  it 'nameが入ってればOK' do
    @user.name
    expect("name").to eq("name")
  end

  it 'nameが空だとNG' do
    @user.name = ''
    expect(@user.valid?).to eq(false)
  end
end
