class ProductInvest < ApplicationRecord
  belongs_to :product
  has_one :subdistrict, through: :product
  has_one :regional, through: :product
  has_one :province, through: :product
  has_one :product_invest_detail, dependent: false

  has_many :pictures, through: :product 
  has_many :user_investors
  
  rails_admin do
	  field :product
	  field :price
	  field :slot
  end
end

