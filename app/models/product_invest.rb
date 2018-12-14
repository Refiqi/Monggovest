class ProductInvest < ApplicationRecord
  belongs_to :product
  has_many :product_invest_details
  has_one :kecamatan, through: :product
  #has_many :regional, through: :product
  #has_one :province, through: :product, source: :regional
end