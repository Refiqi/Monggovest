class ProductInvest < ApplicationRecord
  belongs_to :product
  has_one :subdistrict, through: :product
  has_one :regional, through: :product
  has_one :province, through: :product
  has_one :product_invest_detail, dependent: false
  has_many :pictures, class_name: "Picture", foreign_key: "product_id"
  has_many :user_investors
end
