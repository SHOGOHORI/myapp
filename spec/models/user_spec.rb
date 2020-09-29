require 'rails_helper'

RSpec.describe User, type: :model do
  it '有効なユーザー' do
    expect(FactoryBot.create(:user)).to be_valid
  end
end
