class ProductInvestDetail < ApplicationRecord
  belongs_to :product_invest
  has_one :product, through: :product_invest
  has_many :pictures, through: :product

  has_one :subdistrict, through: :product
  has_one :regional, through: :product
  has_one :province, through: :product
  
end
