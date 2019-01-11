require 'rails_helper'

RSpec.describe UserInvestor, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:product_invests_id) }
  it { should validate_presence_of(:investor_slot) }
  it { should validate_presence_of(:investor_pay) }
  it { should validate_presence_of(:invest_year) }
  it { should validate_presence_of(:created_at) }
  # validates_presence_of :user_id, :product_invests_id, :investor_slot, :investor_pay, :invest_year, :created_by
end
