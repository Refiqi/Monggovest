class Product < ApplicationRecord
  belongs_to :subdistrict 
  belongs_to :regional
  belongs_to :province
  has_many :pictures, dependent: :destroy
  has_many :product_invests, dependent: false
  enum product_type: %i[Sapi Kambing Ayam Bebek Ikan]
end
