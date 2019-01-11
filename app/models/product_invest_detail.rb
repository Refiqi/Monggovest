class ProductInvestDetail < ApplicationRecord
  belongs_to :product_invest
  has_one :product, through: :product_invest
  has_many :pictures, through: :product
end
