# class controller for model user_investor
class UserInvestor < ApplicationRecord
  belongs_to :product_invest
  belongs_to :user
  has_one :investor_detail
  has_one :payment_detail

  validates_presence_of :user_id
  validates_presence_of :product_invest_id
  validates_presence_of :investor_slot
  validates_presence_of :investor_pay
  validates_presence_of :invest_year
  # validates_presence_of :created_at
end
