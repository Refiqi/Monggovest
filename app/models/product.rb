class Product < ApplicationRecord
  belongs_to :subdistrict 
  belongs_to :regional
  belongs_to :province
  has_many :pictures, dependent: :destroy, class_name: "Picture", foreign_key: "product_id"
  has_many :product_invests, dependent: false
  enum product_type: %i[Sapi Kambing Ayam Bebek Ikan]
end
