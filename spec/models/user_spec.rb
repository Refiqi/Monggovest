require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:password) }
  it { should validate_confirmation_of(:password) }
  it { should validate_presence_of(:name) }

  context 'should generate password reset' do
    it 'Should generate password token' do
      user = create(:user)
      user.generate_password_token!
      expect(user.reset_password_token.length).to eq(20)
    end

    it 'should check if token is valid' do
      user = create(:user)
      user.generate_password_token!
      expect(user.password_token_valid?).to eq(true)
    end

    it 'should check if not reset' do
      user = create(:user)
      user.reset_password!('password')
      expect(user.reset_password_token).to eq(nil)
    end
  end
end
