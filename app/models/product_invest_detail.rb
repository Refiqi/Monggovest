class ProductInvestDetail < ApplicationRecord
  belongs_to :product_invest
  has_one :product, through: :product_invest

end
